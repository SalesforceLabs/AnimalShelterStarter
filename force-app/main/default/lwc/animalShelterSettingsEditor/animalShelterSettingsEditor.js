import { LightningElement, wire, track } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';

import getCustomSetting from '@salesforce/apex/AnimalShelterGetCustomSettings.getCustomSettings';
import createDefaultSettings from '@salesforce/apex/AnimalShelterGetCustomSettings.createDefaultSettings';
import hasBreedRecords from '@salesforce/apex/SetupCheckController.hasBreedRecords';
import hasLocationRecords from '@salesforce/apex/SetupCheckController.hasLocationRecords';
import shelterAccountCheck from '@salesforce/apex/SetupCheckController.shelterAccountCheck';

export default class AnimalShelterSettingsEditor extends LightningElement {

    @track settings_data;
    @track hasBreedRecords = false;
    @track noBreedRecords = false;
    @track hasLocationRecords = false;
    @track noLocationRecords = false;
    @track shelterResultTest;

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
            .then(result => {
                this.hasBreedRecords = result;
                this.noBreedRecords = !result;
            })
            .catch(error => {
                console.error('Error:', error);
                this.hasBreedRecords = false;
                this.noBreedRecords = true;
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
                this.shelterResultTest = result;
            })
            .catch((error) => {
                console.error('Error:', error);
                this.shelterResultTest = 'Error performing the check. ';
            });   
    }
}