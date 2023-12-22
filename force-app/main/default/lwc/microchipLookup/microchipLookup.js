/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 12-15-2023
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

    getResults() {

        this.errorMessage = ""

        // Ensure API Key has been set
        if (!this.myCustomSettings.data.animalshelters__microchip_api_Token__c){
            this.resultsFound = false;
            this.isLoading = false;
            this.errorMessage = "No API Token found. Please update your API token in Animal Shelter Settings > Integration.";
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error Loading MicroChip Information',
                    message: "Missing API Key. Please enter the API key in the Animal Shelter Settings within the Integration tab. ",
                    variant: 'error',
                }),
            );
            return;
        }


        // Ensure there is a MicroChip Number
        if (!this.mc_num || this.mc_num == "No MicroChip Number Found. Please Update the record."){
            this.resultsFound = false;
            this.isLoading = false;
            this.errorMessage = "No MicroChip Number Found. Please Update the record."
            this.dispatchEvent(
                new ShowToastEvent({
                    title: "No Microchip Information",
                    message: 'No MicroChip Information found on the record. Ensure that the Microchip Number or Tag field has been populated.',
                    variant: 'error',
                }),
            );
            return;
        }

        // Providing we have values to run the featch, we can now proceed with the lookup
        this.resultsFound = false;
        this.isLoading = true;
        const REC_BODY = {
            token: this.myCustomSettings.data.animalshelters__microchip_api_Token__c,
            uid: this.mc_num,
        };
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
            this.isLoading = false;
            this.resultsFound = true;
            this.resultObject = recDetails;
        });

    }

}