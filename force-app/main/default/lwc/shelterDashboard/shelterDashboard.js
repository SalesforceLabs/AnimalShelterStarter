import { LightningElement, wire, track } from 'lwc';
import getLocationWithAnimals from '@salesforce/apex/ShelterDashboard.getLocationWithAnimals';

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
            this.error = error;
            this.locationsWithAnimals = undefined;
            console.log('Error Returned: ', error);
        }
    }
}