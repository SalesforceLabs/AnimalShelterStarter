import { LightningElement, wire, track } from 'lwc';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';

import getCustomSetting from '@salesforce/apex/AnimalShelterGetCustomSettings.getCustomSettings';
import createDefaultSettings from '@salesforce/apex/AnimalShelterGetCustomSettings.createDefaultSettings';

export default class AnimalShelterSettingsEditor extends LightningElement {
    @track settings_data;

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
}