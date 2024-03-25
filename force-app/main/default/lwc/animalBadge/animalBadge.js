import { LightningElement, api, wire } from 'lwc';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';
import getRelatedBadges from '@salesforce/apex/AnimalBadgeController.getRelatedBadges';

export default class AnimalBadge extends LightningElement {
    @api recordId;
    badges = {};
    channelName = 'event/Badge_Update_Event__e';
    subscription = {};


    // Get initial statuses of Badges for current Animal
    @wire(getRelatedBadges, {animalId: '$recordId'})
    wiredBadges({error, data}){
        if (data) {
            this.badges = data;
            console.log('Badges: ', data)
        } else if (error) {
            console.error(error);
        }
    }

    connectedCallback() {
        this.registerErrorListener();
        this.subscribeToPlatformEvent();
    }

    disconnectedCallback() {
        this.unsubscribeFromPlatformEvent();
    }

    subscribeToPlatformEvent() {
        subscribe(this.channelName, -1, (response) => {
            this.handleEvent(response);
        }).then((response) => {
            console.log('Successfully subscribed to event channel.', response);
            this.subscription = response;
        }).catch(error => {
            console.error('Subscription error', error);
        });
    }

    unsubscribeFromPlatformEvent() {
        unsubscribe(this.subscription, (response) => {
            console.log('Successfully unsubscribed from event channel.', response);
        });
    }

    handleEvent(response) {
        getRelatedBadges({ animalId: this.recordId })
            .then((result) => {
                this.badges = result;
                console.log('Badges Refreshed: ', result);
            })
            .catch((error) => {
                console.log('Error fetching updated badges: ', error);
            });
    }
    
    registerErrorListener() {
        onError((error) => {
            console.log('Received error from server: ', error);
            try {
                if (error.body) {
                    console.log('Error details:', error.body.messsage);
                } else if (error.message) {
                    console.log('Error details:', error.message);
                } else {
                     console.log('Unknown error: ', JSON.stringify(error));
                }
            } catch (e) {
                 console.log('Error: ', e.message);
            }      
        });
    }
}