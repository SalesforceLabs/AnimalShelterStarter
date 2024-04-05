import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';
import { NavigationMixin } from 'lightning/navigation';
import getRelatedAlertRecords from '@salesforce/apex/AlertBannerController.getRelatedAlertRecords';

export default class RecordAlerts extends NavigationMixin(LightningElement) {
  @api recordId;
  @track showRecords;
  @track isNoAlerts;
  records;
  subscription = {};
  channelName = '/event/animalshelters__Animal_Update_Event__e';

  connectedCallback() {
    this.subscribeToPlatformEvent();
    this.loadRelatedAlerts(); // Load alerts on component load
  }

  disconnectedCallback() {
    this.unsubscribeFromPlatformEvent();
  }

  loadRelatedAlerts() {
    getRelatedAlertRecords({ parentId: this.recordId })
        .then(result => {
            if (result && result.length > 0) {

                // Define a mapping of severity levels to numerical values for sorting
                const severityOrder = {
                    'High': 1,
                    'Medium': 2,
                    'Low': 3,
                    'Information Only': 4,
                    'Undefined': 5
                };

                // Sort the result based on severity
                const sortedResult = result.sort((a, b) => {
                    // Compare the mapped numerical values of severity levels
                    return severityOrder[a.animalshelters__Severity_Level__c] - severityOrder[b.animalshelters__Severity_Level__c];
                });


                this.records = result.map(record => {
                    let severityIconName;
                    switch(record.animalshelters__Severity_Level__c) {
                        case 'High':
                            severityIconName = 'custom:custom53';
                            break;
                        case 'Medium':
                            severityIconName = 'custom:custom30';
                            break;
                        default:
                            severityIconName = 'standard:events'; // Default or unknown severity level
                    }
                    // Return the enhanced record with a new property for the icon name
                    return { ...record, severityIconName };
                });
                this.showRecords = true;
                this.isNoAlerts = false;
            } else {
                // No records returned
                this.records = []; // Ensure records is always an array for consistent data type
                this.showRecords = false;
                this.isNoAlerts = true;
            }
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Unable to fetch Animal Alert records',
                    message: error.body.message,
                    variant: 'error',
                }),
            );
            this.showRecords = false;
            this.isNoAlerts = true; // Assuming you want to indicate no alerts in case of error as well
        });
}

  subscribeToPlatformEvent() {
    const messageCallback = (response) => {
      console.log('Event Received : ', JSON.stringify(response));
      // Check if the update type is 'Alert'
      if (response.data.payload.animalshelters__Record_ID__c === this.recordId && (response.data.payload.animalshelters__Update_Type__c === 'Alert' || response.data.payload.animalshelters__Update_Type__c === 'AlertDeleted')) {
        this.loadRelatedAlerts(); // Reload alerts on event trigger
      }
    };

    subscribe(this.channelName, -1, messageCallback).then(response => {
      console.log('Successfully subscribed to ', this.channelName, response);
      this.subscription = response;
    });

    onError(error => {
      console.log('Subscription Error : ', error);
    });
  }

  unsubscribeFromPlatformEvent() {
    unsubscribe(this.subscription, response => {
      console.log('Unsubscribed from ', this.channelName, response);
      this.subscription = null;
    });
  }

  handleClick(event) {
    // Prevent the default action
    event.preventDefault();
    // Get the Alert record Id from the data attribute of the clicked element
    const recordId = event.currentTarget.dataset.alertid;

    // Navigate to the Alert record page
    this[NavigationMixin.Navigate]({
      type: 'standard__recordPage',
      attributes: {
        recordId: recordId,
        actionName: 'view'
      }
    });
  }
}