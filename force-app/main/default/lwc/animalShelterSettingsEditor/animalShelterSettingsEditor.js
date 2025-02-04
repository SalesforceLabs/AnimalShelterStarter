import { LightningElement, wire, track } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';

import getCustomSetting from '@salesforce/apex/AnimalShelterGetCustomSettings.getCustomSettings';
import createDefaultSettings from '@salesforce/apex/AnimalShelterGetCustomSettings.createDefaultSettings';
import hasBreedRecords from '@salesforce/apex/SetupCheckController.hasBreedRecords';
import hasLocationRecords from '@salesforce/apex/SetupCheckController.hasLocationRecords';
import shelterAccountCheck from '@salesforce/apex/SetupCheckController.shelterAccountCheck';
import checkPageLayouts from '@salesforce/apex/LocationPageLayoutCheckController.checkPageLayouts';
import checkPathSettings from '@salesforce/apex/SetupCheckController.checkPathSettings';


export default class AnimalShelterSettingsEditor extends LightningElement {

    @track settings_data;
    @track breedRecordCount = 0;
    @track hasLocationRecords = false;
    @track noLocationRecords = false;
    @track shelterResultText;
    @track locationLayoutStatus;
    @track isChecked = false;
    @track results;

    get hasRecords() {
        return this.breedRecordCount > 0;
    }

    @wire(getCustomSetting)
    wiredSettings({ error, data }) {
        if (data) {
            this.settings_data = data;
        } else if (error) {
            console.error(error);
        } else {
            createDefaultSettings({}).then(result => {
                this.settings_data = result;
            }).catch(error => {
                console.error(error);
            });
        }
    }

    handleBooleanChange(event) {
        const field = event.target.dataset.field;
        const value = event.target.checked;
        const recordInput = { fields: { [field]: value, Id: this.settings_data.Id } };
        updateRecord(recordInput).then(() => {
            // Update succeeded
        }).catch(error => {
            console.error(error);
        });
    }

    handleTextChange(event) {
        const field = event.target.dataset.field;
        const value = event.target.value;
        const recordInput = { fields: { [field]: value, Id: this.settings_data.Id } };
        updateRecord(recordInput).then(() => {
            // Update succeeded
        }).catch(error => {
            console.error(error);
        });
    }

    handleCheck() {
        hasBreedRecords()
            .then((count) => {
                this.breedRecordCount = count;
                this.isChecked = true;
            })
            .catch(error => {
                console.error('Error:', error);
                this.isChecked = false;
            });
        
        hasLocationRecords()
           .then(result => {
                this.hasLocationRecords = result;
                this.noLocationRecords =!result;
            })
           .catch(error => {
               console.error('Error:', error);
               this.hasLocationRecords = false;
               this.noLocationRecords = true;
           });

        shelterAccountCheck()
            .then((result) => {
                this.shelterResultText = result;
            })
            .catch((error) => {
                console.error('Error:', error);
                this.shelterResultText = 'Error performing the check. ';
            });

        checkPathSettings()
            .then((result) => {
                this.results = Object.defineProperties(result).map(([Key, value]) => ({
                    key,
                    value,
                }));
            })
            .catch((error) => {
                this.error = 'Failed to check path settings: ' + error.body.message;
            });
            
        checkPageLayouts()
            .then((result) => {
                this.locationLayoutStatus = result;
            })
            .catch(error => {
                console.error(error);
                this.locationLayoutStatus = 'Error fetching Location Page Layout Data';
        });
    }
}