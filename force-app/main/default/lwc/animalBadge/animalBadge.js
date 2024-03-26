import { LightningElement, api, wire } from 'lwc';
import { subscribe, unsubscribe, onError, setDebugFlag, isEmpEnabled } from 'lightning/empApi';
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

    // Initializes the component
    connectedCallback() {
        // Register error listener
        this.registerErrorListener();
        this.handleSubscribe()
    }
    
    // Handles subscribe button click
    handleSubscribe() {
        // Callback invoked whenever a new event message is received
        const messageCallback = (response) => {
            console.log('New message received: ', JSON.stringify(response));
            // Response contains the payload of the new message received
            //this.handleEvent(response);
        };

        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, -1, messageCallback).then((response) => {
            // Response contains the subscription information on subscribe call
            console.log('Subscription request sent to: ', JSON.stringify(response.channel));
            this.subscription = response;
        });
    }

    handleEvent(response){
        getRelatedBadges({ animalId: this.recordId })
            .then((result) => {
                this.badges = result;
                console.log('Badges Refreshed: ', result);
            })
            .catch((error) => {
                console.log('Error fetching updated badges: ', error);
            });
    }

    disconnectedCallback() {
        // Invoke unsubscribe method of empApi
        unsubscribe(this.subscription, (response) => {
            console.log('unsubscribe() response: ', JSON.stringify(response));
            // Response is true for successful unsubscribe
        });
    }
    
    registerErrorListener() {
        // Invoke onError empApi method
        onError((error) => {
            console.log('Received error from server: ', JSON.stringify(error));
            // Error contains the server-side error
        });
    }
}