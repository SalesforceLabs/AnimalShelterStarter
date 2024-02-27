import { LightningElement, wire, track } from 'lwc';
import getLocationWithAnimals from '@salesforce/apex/ShelterDashboardController.getLocationWithAnimals';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class ShelterDashboard extends LightningElement {
    @track locationsWithAnimals;
    @track error;

    @wire(getLocationWithAnimals)
    wiredLocations({ error, data }){
        if (data) {
            this.locationsWithAnimals = data;
            this.error = undefined;
            console.log('Data Returned: ', data);
        } else if (error) {
            console.log('Error Returned: ', error);
            this.error = error;
            this.locationsWithAnimals = undefined;
            const event = new ShowToastEvent({
                title: 'Error',
                message: error.message,
                variant: 'error'
            });
            this.dispatchEvent(event);
        }
    }
}