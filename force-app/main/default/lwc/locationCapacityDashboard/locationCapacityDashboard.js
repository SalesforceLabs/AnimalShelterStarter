import { LightningElement, wire, track } from 'lwc';
import getLocations from '@salesforce/apex/LocationCapacityDashboardController.getLocations';

export default class LocationCapacityDashboard extends LightningElement {

    @track locations = [];
    @track error;
    selectedSiteId;

    @wire(getLocations, { siteId: '$SelectedSiteId' })
    wiredLocations( { error, data }) {
        if (data) {
            this.locations = result.data;
            this.error = undefined
        } else if (error) {
            this.error = error;
            this.locations = undefined;
        }
    }

    handleSiteChange(event) {
        this.selectedSiteId = event.target.value;
    }
}
