import { LightningElement, track, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import w3w_FIELD from '@salesforce/schema/Animal__c.what3words__c';
import getCustomSettings from '@salesforce/apex/AnimalShelterGetCustomSettings.getCustomSettings';
import LightningModal from 'lightning/modal';

const ENDPOINT = 'https://api.what3words.com/v3/'
const POST_METHOD = 'POST';
const CONTENT_TYPE = 'application/json; charset=utf-8';


export default class what3wordslookup extends LightningElement {

    @wire(getCustomSettings)
    myCustomSettings;

    @api content;

    @track isModalOpen;

    @track results;
    @track resultsFound = false;
    @track isLoading = false;
    @track resultObject;
    @api recordId;

    @track w3w_text;

    @wire(getRecord, { recordId: '$recordId', fields: w3w_FIELD })
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
            if (this.CurrentRecord.fields.what3words__c.value) {
                this.w3w_text = this.CurrentRecord.fields.what3words__c.value;
            } else {
                this.w3w_text = 'No Location Found. Please Update the record.'
            }
        }
    }

    handleImgClick(event) {
        this.content = event.target.dataset.imgsrc;
        this.isModalOpen = true;
    }

    handleOkay() {
        //this.close('okay');
        this.isModalOpen = false;
    }

    getResults() {
        console.log("Starting")
        console.log(this.myCustomSettings)
        //token = this.myCustomSettings.data.what3words_API_key__c;
        if (this.w3w_text == 'No MicroChip Found. Please Update the record.') {
            this.resultsFound = false;
            this.isLoading = false;
        } else {
            this.resultsFound = false;
            this.isLoading = true;
            const REC_BODY = {
                token: this.myCustomSettings.data.what3words_API_Key__c,
                uid: this.w3w_text,
            };
            fetch(ENDPOINT, {
                method: POST_METHOD,
                headers: {
                    'Content-Type': CONTENT_TYPE,
                },
                body: JSON.stringify(REC_BODY)
            }).then((response) => {
                //console.log(response);

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
                            title: 'Error Loading what3words Information',
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

}