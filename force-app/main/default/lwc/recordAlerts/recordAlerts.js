import { LightningElement, wire, api, track} from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class RecordAlerts extends NavigationMixin(LightningElement) {
  @api recordId;
  @track isNoAlerts;
  error;
  records;


  @wire(getRelatedListRecords, {
      parentRecordId: '$recordId',
      relatedListId: '%%%NAMESPACED_ORG%%%Animal_Alerts__r',
      fields: ['%%%NAMESPACED_ORG%%%Animal_Alert__c.Id','%%%NAMESPACED_ORG%%%Animal_Alert__c.%%%NAMESPACED_ORG%%%Alert_Message__c','%%%NAMESPACED_ORG%%%Animal_Alert__c.%%%NAMESPACED_ORG%%%Start_Date_Time__c','%%%NAMESPACED_ORG%%%Animal_Alert__c.%%%NAMESPACED_ORG%%%End_Date_Time__c','%%%NAMESPACED_ORG%%%Animal_Alert__c.%%%NAMESPACED_ORG%%%Severity_Level__c','%%%NAMESPACED_ORG%%%Animal_Alert__c.%%%NAMESPACED_ORG%%%Type__c'],
      where: "{ %%%NAMESPACED_ORG%%%IsDisplayed__c: { eq: true } }"
  })listInfo({ error, data }) {
      if (data) {
            this.records = data.records;
            this.isNoAlerts = false
            if (this.records.length === 0) {
                this.isNoAlerts = true;
            }
            this.error = undefined;
      } else if (error) {
            this.error = error;
            this.isNoAlerts = true;
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
        type: '%%%NAMESPACED_ORG%%%standard__recordPage',
        attributes: {
            actionName: "view",
            objectApiName: "%%%NAMESPACED_ORG%%%Animal_Alert__c",
            recordId: recordId
        }
    });
    }

}
