import { LightningElement, track, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import MC_FIELD from '@salesforce/schema/%%%NAMESPACED_ORG%%%Animal__c.%%%NAMESPACED_ORG%%%Microchip__c';
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
            if (this.CurrentRecord.fields.%%%NAMESPACED_ORG%%%Microchip__c.value) {
                this.mc_num = this.CurrentRecord.fields.%%%NAMESPACED_ORG%%%Microchip__c.value;
            } else {
                this.mc_num = 'No MicroChip Found. Please Update the record.'
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
        //token = this.myCustomSettings.data.%%%NAMESPACED_ORG%%%microchip_api_Token__c;
        if (this.mc_num == 'No MicroChip Found. Please Update the record.') {
            this.resultsFound = false;
            this.isLoading = false;
        } else {
            this.resultsFound = false;
            this.isLoading = true;
            const REC_BODY = {
                token: this.myCustomSettings.data.%%%NAMESPACED_ORG%%%microchip_api_Token__c,
                uid: this.mc_num,
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

}
