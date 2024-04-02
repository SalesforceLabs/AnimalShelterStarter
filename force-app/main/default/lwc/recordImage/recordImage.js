/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 02-19-2024
 * @last modified by  : Stewart Anderson
**/
import { LightningElement, wire, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';

// Animal Object References
import ANIMAL_ID_FIELD from '@salesforce/schema/Animal__c.Id';
import ANIMAL_PHOTO_ID_FIELD from '@salesforce/schema/Animal__c.Photo_Id__c';

// Contact Object References
import CONTACT_ID_FIELD from '@salesforce/schema/Contact.Id';
import CONTACT_PHOTO_ID_FIELD from '@salesforce/schema/Contact.Photo_Id__c';

// Placeholder Image Static Resource
import PLACEHOLDER from '@salesforce/resourceUrl/PlaceHolderImage';

export default class recordImage extends LightningElement {

    // Global Record Parameters
    @api recordId;
    @api objectApiName;
    CurrentRecord;
    IdField
    photoIdField

    // Photo Field and ID
    photoId;
    photoURL;

    // Placeholder Image
    placeholderURL = PLACEHOLDER

    // Configure Component based on Object on init
    connectedCallback() {
        if (this.objectApiName === 'Contact') {
            this.IdField = CONTACT_ID_FIELD
            this.photoIdField = CONTACT_PHOTO_ID_FIELD
        }
        if (this.objectApiName === 'animalshelters__Animal__c') {
            this.IdField = ANIMAL_ID_FIELD
            this.photoIdField = ANIMAL_PHOTO_ID_FIELD
        }
    }

    // Wire Record and load Photo Id Field
    @wire(getRecord, { recordId: '$recordId', fields: '$photoIdField' })
    wiredRecord({ error, data }) {
        if (error) {
            let message = 'Unknown error';
            if (Array.isArray(error.body)) {
                message = error.body.map(e => e.message).join(', ');
            } else if (typeof error.body.message === 'string') {
                message = error.body.message;
            }
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error Loading Record',
                    message,
                    variant: 'error',
                }),
            );
        } else if (data) {
            this.CurrentRecord = data;
            if (this.CurrentRecord.fields.animalshelters__Photo_Id__c.value) {
                this.photoId = this.CurrentRecord.fields.animalshelters__Photo_Id__c.value;
                this.photoURL = '/sfc/servlet.shepherd/version/download/' + this.photoId;
            }
        }
    }

    // Set Accepted Photo Formats
    get acceptedFormats() {
        return ['.png', '.jpg', '.jpeg', '.webp', '.heic', '.heif', '.avif', '.bmp', '.gif'];
    }

    // Handle a Completed Upload of the Photo
    handleUploadFinished(event) {
        const uploadedFiles = event.detail.files;
        this.photoId = uploadedFiles[0].contentVersionId;
        this.updateRecord(this.photoId);
        this.photoURL = '/sfc/servlet.shepherd/version/download/' + this.photoId;
    }

    // Update the PhotoId Field on the Record
    updateRecord(photoId) {
        const fields = {};

        if (this.objectApiName === 'Contact') {
            fields[CONTACT_ID_FIELD.fieldApiName] = this.recordId;
            fields[CONTACT_PHOTO_ID_FIELD.fieldApiName] = photoId;
        }
        if (this.objectApiName === 'animalshelters__Animal__c') {
            fields[ANIMAL_ID_FIELD.fieldApiName] = this.recordId;
            fields[ANIMAL_PHOTO_ID_FIELD.fieldApiName] = photoId;
        }

        const recordInput = { fields };
        updateRecord(recordInput)
            .then(() => {
                if (this.objectApiName === 'Contact') {
                    return refreshApex(this.Contact);
                }
                if (this.objectApiName === 'animalshelters__Animal__c') {
                    return refreshApex(this.animalshelters__Animal__c);
                }

            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error Uploading Photo',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }
}
