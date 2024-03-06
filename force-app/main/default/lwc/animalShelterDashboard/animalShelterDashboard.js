import { LightningElement, wire, track } from 'lwc';
import getLocationsWithAnimals from '@salesforce/apex/AnimalShelterDashboardController.getLocationsWithAnimals';
import getSites from '@salesforce/apex/AnimalShelterDashboardController.getSites';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AnimalShelterDashboard extends LightningElement {

    @track locations;
    @track error;
    @track isModalOpen = false; 
    @track currentAnimal;
    selectedSite;

    @wire(getLocationsWithAnimals, { site: '$selectedSite' })
    wiredLocations({ error, data }){
        if (data) {
            this.locations = data;
            this.error = undefined;
            console.log('Data Returned: ', data);
        } else if (error) {
            console.log('Error Returned: ', error);
            this.error = error;
            this.locations = undefined;
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

    handleAnimalClick(event) {
        const animalId = event.currentTarget.dataset.id;
        console.log('AnimalId: ',animalId);
        this.currentAnimal = this.findAnimalById(animalId);
            if (this.currentAnimal){
                this.isModalOpen = true;
            } else {
                console.error('Animal not found');
            }
    }

    handleModalClose(){
        this.isModalOpen = false;
    }

    findAnimalById(animalId) {
        for (let location of this.locations) {
            for (let animal of location.animals) {
                if (animal.animal.Id === animalId){
                    console.log('Animal: ',animal);
                    return animal;

                }
            }
        }
        return null;
    }
}