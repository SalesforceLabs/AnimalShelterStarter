import { LightningElement, wire, track } from 'lwc';
import getLocationsWithAnimals from '@salesforce/apex/ShelterDashboardController.getLocationsWithAnimals';
import getSites from '@salesforce/apex/ShelterDashboardController.getSites';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class ShelterDashboard extends LightningElement {
    @track locationsWithAnimals;
    @track error;
    selectedSite;

    @wire(getLocationsWithAnimals, { site: '$selectedSite' })
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

    @wire(getSites)
    wiredSites({ error, data }){
        if (data) {
            this.siteOptions = data.map(site => ({
                label: site.animalshelters__Name__c, value: site.animalshelters__Sitename__c
            }));
            console.log('Site Data', data);
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.siteOptions = undefined;
        }
    }

    handleSiteChange(event) {
        this.selectedSite = event.detail.value;
    }
}