/**
 * @description       : Animals in Location - Displays Animals in the current Location
 * @author            : Chris Rolfe
 * @group             :
 * @last modified on  : 22-08-2024
 * @last modified by  : Chris Rolfe
**/

import { LightningElement, api, wire } from 'lwc';
import getAnimalsInLocation from '@salesforce/apex/LocationAnimalController.getAnimalsInLocation';
import { getRecord } from 'lightning/uiRecordApi';
import RECORDTYPE_FIELD from '@salesforce/schema/Locations__c.RecordType.Name';

export default class LocationAnimals extends LightningElement {
    @api recordId; // Current Location record ID

    animals = [];
    isUnit = false;
    hasAnimals = false;
    
    // Fetch the RecordType of the Location to check if it's a Unit
    @wire(getRecord, { recordId: '$recordId', fields: [RECORDTYPE_FIELD] })
    wiredLocation({ error, data }) {
        if (data) {
            const recordTypeName = data.fields.RecordType.value.fields.Name.value;
            this.isUnit = recordTypeName === 'Unit';
            if (this.isUnit) {
                this.fetchAnimals(); // Fetch animals only if RecordType is Unit
            }
        } else if (error) {
            console.error('Error fetching Location record:', error);
        }
    }

    // Fetch animals related to the Location via the Movement object
    fetchAnimals() {
        getAnimalsInLocation({ locationId: this.recordId })
            .then(result => {
                this.animals = result;
                this.hasAnimals = result.length > 0;
                console.log('Animals: ', this.animals, '\n\n');
                console.log('Has Animals:', this.hasAnimals, '\n\n');
            })
            .catch(error => {
                console.error('Error fetching Animals:', error);
            });
    }
}
