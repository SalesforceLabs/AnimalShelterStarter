import { LightningElement, wire, track } from 'lwc';
import getLocations from '@salesforce/apex/LocationCapacityDashboardController.getLocations';
import getSites from '@salesforce/apex/LocationCapacityDashboardController.getSites';

export default class LocationCapacityDashboard extends LightningElement {

    @track locations = [];
    @track siteOptions = [];
    @track error;
    selectedSiteId;

    @wire(getLocations, { siteId: '$selectedSiteId' })
    wiredLocations( { error, data }) {
        if (data) {
            this.locations = data;
            this.error = undefined
        } else if (error) {
            this.error = error;
            this.locations = undefined;
        }
    }
    @wire(getSites)
    wiredSites({ error, data }){
        if (data) {
            this.siteOptions = data.map(site => ({
                label: site.animalshelters__Name__c,
                value: site.Id
            }));
            console.log('Site Data', data);
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.siteOptions = undefined;
        }
    }

    handleSiteChange(event) {
        this.selectedSiteId = event.detail.value;
    }
}
