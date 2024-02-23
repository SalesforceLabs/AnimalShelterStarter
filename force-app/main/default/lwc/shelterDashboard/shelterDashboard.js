import { LightningElement, wire, track } from 'lwc';
import getUnitLocations from '@salesforce/apex/ShelterDashboard.getUnitLocations';

export default class ShelterDashboard extends LightningElement {
    @track locations = [];

    @wire(getUnitLocations)
    wiredLocations({ error, data }){
        if (data) {
            console.log('Data Returned: ', data);
            this.locations = data;
        } else if (error) {
            console.log('Error Returned: ', error);
        }
    }
}