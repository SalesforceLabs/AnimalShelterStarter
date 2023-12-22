/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 11-06-2023
 * @last modified by  : Stewart Anderson
**/
import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import getFieldSet from '@salesforce/apex/AnimalShelterFieldsetController.getFieldSet';
import getBadgeFieldsData from '@salesforce/apex/AnimalShelterFieldsetController.getBadgeFieldsData';

export default class LightningPrintPreview extends LightningElement {
  @api recordId;
  @api fieldSetName;
  @api sObjectTypeName;
  @api badgefields;
  @track badgeData = {};


  fieldSetMembers = [];
  recordData;
  error;

  get qualifiedFieldNames() {
    // Check if sObjectTypeName and fieldSetMembers are available
    if (this.sObjectTypeName && Array.isArray(this.fieldSetMembers)) {
      return this.fieldSetMembers.map(fsm => `${this.sObjectTypeName}.${fsm.apiName}`);
    }
    return [];
  }

  get qrCodeUrl() {
    const baseUrl = 'https://' + window.location.hostname;
    const qrCodeBaseUrl = 'https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=';
    const recordUrl = baseUrl + '/' + this.recordId;

    return qrCodeBaseUrl + encodeURIComponent(recordUrl);
  }

  @wire(getFieldSet, { sObjectName: '$sObjectTypeName', fieldSetName: '$fieldSetName' })
  wiredFieldSet({ error, data }) {
    if (data) {
      this.fieldSetMembers = data;
      this.error = undefined;
    } else if (error) {
      this.error = 'No fieldset found.';
      this.fieldSetMembers = [];
    }
  }

  @wire(getRecord, { recordId: '$recordId', fields: '$qualifiedFieldNames' })
  wiredRecord({ error, data }) {
    if (data) {
      this.recordData = data;
      this.error = undefined;
      //console.log('Data returned')
      //console.log(JSON.stringify(data))
    } else if (error) {
      this.error = 'Error fetching record data.';
      console.error('Record Data Error:', error);
      console.error(JSON.stringify(error));
      this.recordData = undefined;
    }
  }

  get fieldNames() {
    // Map field set members to field names for the wire service
    return this.fieldSetMembers.map(fsm => fsm.apiName);
  }

  get fields() {
    if (!this.fieldSetMembers.length || !this.recordData) {
      return [];
    }

    // Map the field set members to an array that includes the field label and value
    return this.fieldSetMembers.map(fsm => {
      return {
        label: fsm.label,
        value: this.recordData.fields[fsm.apiName].value
      };
    });
  }

  @wire(getBadgeFieldsData, {
    recordId: '$recordId',
    sObjectName: '$sObjectTypeName',
    badgeFieldNames: '$parsedBadgeFields'
  })
  wiredBadgeData({ error, data }) {
    if (data) {
      // Flatten the values into a single list of badges
      let badges = [];
      for (const [key, value] of Object.entries(data)) {
        badges = badges.concat(value);
      }
      this.badgeData = badges;
    } else if (error) {
      console.error('Error retrieving badge data:', error);
      // Handle error appropriately
    }
  }

  get parsedBadgeFields() {
    return this.badgefields ? this.badgefields.split(',') : [];
  }

}