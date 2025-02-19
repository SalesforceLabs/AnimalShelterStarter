import { LightningElement, wire, track } from 'lwc';
import getLocationHierarchy from '@salesforce/apex/ShelterOverviewController.getLocationHierarchy';

export default class ShelterOverview extends LightningElement {
    @track locations = [];
    @track sites = [];
    @track blocks = [];
    @track selectedSite = '';
    @track selectedBlock = '';
    @track filteredLocations = [];

    @wire(getLocationHierarchy)
    wiredLocations({ error, data }) {
        if (data) {
            this.locations = data;
            this.sites = data.map(site => ({ label: site.name, value: site.id }));
            this.filteredLocations = data; // Initially display all locations
        } else if (error) {
            console.error('Error retrieving locations:', error);
        }
    }

    handleSiteChange(event) {
        this.selectedSite = event.target.value;
        const selectedSiteData = this.locations.find(site => site.id === this.selectedSite);

        if (selectedSiteData) {
            this.blocks = selectedSiteData.children.map(block => ({
                label: block.name,
                value: block.id
            }));
        } else {
            this.blocks = [];
        }

        this.selectedBlock = ''; // Reset Block selection
        this.updateFilteredLocations();
    }

    handleBlockChange(event) {
        this.selectedBlock = event.target.value;
        this.updateFilteredLocations();
    }

    updateFilteredLocations() {
        if (this.selectedSite) {
            const siteData = this.locations.find(site => site.id === this.selectedSite);
            if (this.selectedBlock) {
                this.filteredLocations = [
                    {
                        ...siteData,
                        children: siteData.children.filter(block => block.id === this.selectedBlock)
                    }
                ];
            } else {
                this.filteredLocations = [siteData];
            }
        } else {
            this.filteredLocations = this.locations;
        }
    }

    /** Getter to determine if Block dropdown should be disabled **/
    get isBlockDisabled() {
        return this.blocks.length ===0;
    }
}
