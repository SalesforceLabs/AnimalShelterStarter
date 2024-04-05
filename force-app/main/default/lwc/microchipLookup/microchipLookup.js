/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 01-15-2024
 * @last modified by  : Stewart Anderson
**/
import { LightningElement, track, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import MC_FIELD from '@salesforce/schema/Animal__c.Microchip__c';
import getCustomSettings from '@salesforce/apex/AnimalShelterGetCustomSettings.getCustomSettings';
import LightningModal from 'lightning/modal';

const ENDPOINT = 'https://api.chipndoodle.com/searches'
const POST_METHOD = 'POST';
const CONTENT_TYPE = 'application/json; charset=utf-8';


export default class MicrochipLookup extends LightningElement {

    @wire(getCustomSettings)
    myCustomSettings;

    @api content;

    @track isModalOpen;

    @track results;
    @track resultsFound = false;
    @track isLoading = false;
    @track resultObject;
    @api recordId;
    @track errorMessage;

    @track mc_num;

    @wire(getRecord, { recordId: '$recordId', fields: MC_FIELD })
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
            if (this.CurrentRecord.fields.animalshelters__Microchip__c.value) {
                this.mc_num = this.CurrentRecord.fields.animalshelters__Microchip__c.value;
            } else {
                this.mc_num = 'No MicroChip Number Found. Please Update the record.'
            }
        }
    }

    handleImgClick(event) {
        this.content = event.target.dataset.imgsrc;
        this.isModalOpen = true;
    }

    handleOkay() {
        this.isModalOpen = false;
    }

    // Utility function to validate MicroChip number
    validateMicroChipNumber(mcNum) {
        return /^[0-9A-Za-z]+$/.test(mcNum);
    }

    sanitizeApiResponse(data) {

        const sanitizeString = (str) => {
            // Replace any characters that could be used in XSS attacks
            return str.replace(/[<>"'/]/g, '');
        };

        const sanitizeObject = (obj) => {
            for (let key in obj) {
                if (typeof obj[key] === 'string') {
                    obj[key] = sanitizeString(obj[key]);
                } else if (typeof obj[key] === 'object' && obj[key] !== null) {
                    sanitizeObject(obj[key]);
                }
            }
        };

        if (typeof data === 'object' && data !== null) {
            sanitizeObject(data);
        }

        return data;
    }

    handleErrorMessage() {
        this.resultsFound = false;
        this.isLoading = false;
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error Loading MicroChip Information',
                message: this.errorMessage,
                variant: 'error',
            }),
        );
    }

    getResults() {

        // Set Defaults
        this.errorMessage = ""
        this.resultsFound = false;
        this.isLoading = true;

        // Ensure API Key has been set
        if (!this.myCustomSettings.data.animalshelters__microchip_api_Token__c) {
            this.errorMessage = "No API Token found. Please update your API token in Animal Shelter Settings > Integration.";
            this.handleErrorMessage(this.errorMessage);
            return;
        }


        // Ensure there is a MicroChip Number
        if (!this.mc_num || this.mc_num === "No MicroChip Number Found. Please Update the record.") {
            this.errorMessage = "No MicroChip Number Found. Please Update the record."
            this.handleErrorMessage(this.errorMessage);
            return;
        }

        // Ensure Microchip Number is valid before making API call
        if (!this.validateMicroChipNumber(this.mc_num)) {
            this.errorMessage = "Invalid MicroChip Number Found. Please Update the record."
            this.handleErrorMessage(this.errorMessage);
            return;
        }

        // Providing we have values to run the fetch, we can now proceed with the lookup
        const REC_BODY = {
            token: this.myCustomSettings.data.animalshelters__microchip_api_Token__c,
            uid: this.mc_num,
        };
        console.log("Sending Request")
        console.log(REC_BODY)

        fetch(ENDPOINT, {
            method: POST_METHOD,
            headers: {
                'Content-Type': CONTENT_TYPE,
            },
            body: JSON.stringify(REC_BODY)
        }).then((response) => {
            if (response.ok) {
                return response.json();
            } else {
                this.isLoading = false;
                this.resultsFound = false;
                let message = 'Unknown error';
                if (Array.isArray(response.body)) {
                    message = response.body.map(e => e.message).join(', ');
                } else if (typeof response.body.message === 'string') {
                    message = response.body.message;
                }
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error Loading MicroChip Information',
                        message,
                        variant: 'error',
                    }),
                );

            }
        }).then(recDetails => {

            // Check we actually have data
            if (!recDetails || recDetails.length === 0) {
                this.errorMessage = "A response was received although there was no microchip information found."
                this.handleErrorMessage(this.errorMessage);
                return
            }
            if (!recDetails.responses || recDetails.responses.length === 0) {
                this.errorMessage = "A response was received although the responses from the API was empty."
                this.handleErrorMessage(this.errorMessage);
                return
            } else {
                this.resultsFound = true;
            }

            // Sanitize the API response and return object
            this.isLoading = false;
            this.resultObject = this.sanitizeApiResponse(recDetails);
        }).catch(error => {
            this.errorMessage = error
            this.handleErrorMessage(this.errorMessage);

        });

    }

}