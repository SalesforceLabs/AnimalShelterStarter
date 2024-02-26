import { LightningElement, wire, track } from 'lwc';
import getLocationWithAnimals from '@salesforce/apex/ShelterDashboardController.getLocationWithAnimals';
import { ShowToastEvents } from 'lightning/platformShowToastEvent';


export default class ShelterDashboard extends LightningElement {
    @track locationsWithAnimals;
    @track error;
    @track showAdditionalAnimalInfo

    @wire(getLocationWithAnimals)
    wiredLocations({ error, data }){
        if (data) {
            this.locationsWithAnimals = data;
            this.error = undefined;
            console.log('Data Returned: ', data);
        } else if (error) {
            console.log('Error Returned: ', error);
            // Show error toast
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: error.message,
                    variant: 'error',
                }),
            );
        }
    }
}