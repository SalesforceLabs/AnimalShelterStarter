import { LightningElement, api, wire } from 'lwc';
import { subscribe, unsubscribe, onError, setDebugFlag, isEmpEnabled } from 'lightning/empApi';
import { refreshApex } from '@salesforce/apex';
import getRelatedBadges from '@salesforce/apex/AnimalBadgeController.getRelatedBadges';

export default class AnimalBadge extends LightningElement {
    @api recordId;
    badges = {};
    channelName = '/event/Badge_Update_Event__e';
    subscription = {};
    wiredBadgesResult;


    //Get initial statuses of Badges for current Animal
    @wire(getRelatedBadges, {animalId: '$recordId'})
    wiredBadges(response) {
        this.wiredBadgesResult = response;
        console.log('Result --->', response);
        const { data, error } = response;
        if (data) {
            this.badges = data;
            console.log('Badges: ', data);
        } else if (error) {
            console.error(error);
        }
    }

    // Initial Component Setup
    connectedCallback() {
        this.registerErrorListener();
        this.subscribeToPE();
    }

    disconnectedCallback() {
        // Invoke unsubscribe
        unsubscribe(this.subscription, response => {
            console.log('Unsubscribed from: ', response.channel);
        });
    }
    
    // Subscribe to Platform Event
    subscribeToPE() {
        const messageCallback = (response) => {
            console.log('New message received: ', JSON.stringify(response));
            // Check if the event is for the current Animal
            console.log('Message Record Id: ', response.data.payload.animalshelters__Record_ID__c);
            console.log('Current Record Id: ', this.recordId);
            if (response.data.payload.animalshelters__Record_ID__c === this.recordId){
                refreshApex(this.wiredBadgesResult);
            }
        };
        subscribe(this.channelName, -1, messageCallback).then(response => {
            console.log('Subscription request sent to: ', JSON.stringify(response.channel));
            this.subscription = response;
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