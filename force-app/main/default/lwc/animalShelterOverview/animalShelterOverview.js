import { LightningElement, wire, track } from 'lwc';
import getSites from '@salesforce/apex/AnimalShelterOverviewController.getSites';
import getBlocks from '@salesforce/apex/AnimalShelterOverviewController.getBlocks';
import getUnitsAndSubBlockUnits from '@salesforce/apex/AnimalShelterOverviewController.getUnitsAndSubBlockUnits';
import getAnimalsByUnit from '@salesforce/apex/AnimalShelterOverviewController.getAnimalsByUnit';

export default class AnimalShelterOverview extends LightningElement {
    @track siteOptions = [];
    @track blockOptions = [];
    @track units = [];
    selectedSite;
    selectedBlock;

    @wire(getSites)
    wiredSites({ data, error}) {
        if (data) {
            this.siteOptions = data.map(site => ({ label: site.animalshelters__Name__c, value: site.Id}));
        } else if (error) {
            console.log('Error fetching sites', error);

        }
    }


    handleSiteChange(event) {
        this.selectedSite = event.detail.value;
        this.selectedBlock = null;
        this.units = [];
        this.blockOptions = [];
        
        getBlocks({ siteId: this.selectedSite })
            .then(blocks => {
                this.blockOptions = blocks.map(block => ({ label: block.animalshelters__Name__c, value: block.Id}));
            })
            .catch(error => console.log('Error fetching blocks', error));
    }


    handleBlockChange(event) {
        this.selectedBlock = event.detail.value;
        this.units = [];

        getUnitsAndSubBlockUnits({ blockId: this.selectedBlock })
            .then(units => {
                const unitIds = units.map(unit => unit.Id);

                getAnimalsByUnit({ unitIds })
                    .then(animalMap => {
                        this.units = units.map(unit => {
                            const animals = animalMap[unit.Id] || [];
                            return {
                                ...unit,
                                animals: animals.map((animal, index, arr) => ({
                                ...animal,
                                hasNext: index < arr.length - 1,
                                dividerKey: `${animal.Id}_divider`
                            })),
                            boxClass: animals.length ===0
                                ? 'slds-box slds-theme_shade slds-var-p-around_medium slds-var-m-bottom_medium'
                                : 'slds-box slds-theme_default slds-var-p-around_medium slds-var-m-bottom_medium'
                        };
                    });
                })
                    .catch(error => console.log('Error fetching animals', error));
            })
            .catch(error => console.log('Error fetching units', error));
    }

}