/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 12-15-2023
 * @last modified by  : Stewart Anderson
**/
import { LightningElement, wire, api, track} from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class RecordAlerts extends NavigationMixin(LightningElement) {
  @api recordId;
  @track isNoAlerts;
  @track showRecords;
  error;
  records;


  @wire(getRelatedListRecords, {
      parentRecordId: '$recordId',
      relatedListId: 'animalshelters__Animal_Alerts__r',
      fields: ['animalshelters__Animal_Alert__c.Id','animalshelters__Animal_Alert__c.animalshelters__Alert_Message__c','animalshelters__Animal_Alert__c.animalshelters__Start_Date_Time__c','animalshelters__Animal_Alert__c.animalshelters__End_Date_Time__c','animalshelters__Animal_Alert__c.animalshelters__Severity_Level__c','animalshelters__Animal_Alert__c.animalshelters__Type__c'],
      where: "{ animalshelters__IsDisplayed__c: { eq: true } }"
  })listInfo({ error, data }) {

      console.log("Animal Alerts LWC: Loading Records...");

      this.isNoAlerts = true;
      this.showRecords = false;
      this.error = undefined;

      if (data) {
            console.log("Animal Alerts LWC: Records Found!");
            //console.log(data)
            //console.log(data.records)
            if (data.records.length > 0){
                console.log("Animal Alerts LWC: Loading Alert Data");
                this.isNoAlerts = false;
                this.showRecords = true;
                this.records = data.records;
            }
      } else if (error) {
            this.records = undefined;
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
      }
  }

  handleClick(event){
    const recordId = event.target.dataset.alertid;
    event.preventDefault();
    event.stopPropagation();
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            actionName: "view",
            objectApiName: "animalshelters__Animal_Alert__c",
            recordId: recordId
        }
    });
    }

}