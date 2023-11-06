/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 11-06-2023
 * @last modified by  : Stewart Anderson
**/
import { LightningElement, api, wire } from 'lwc';
import { getObjectInfo, getFieldValue } from 'lightning/uiRecordApi';
import getFieldSet from '@salesforce/apex/AnimalShelterFieldsetController.getFieldSet';

export default class LightningPrintPreview extends LightningElement {
  @api recordId;
  @api fieldSetName;
  @api sObjectTypeName;

  fieldSetData;
  objectInfo;
  error;

  @wire(getObjectInfo, { objectApiName: '$sObjectTypeName' })
  objectInfo;

  @wire(getFieldSet, { sObjectName: '$sObjectTypeName', fieldSetName: '$fieldSetName' })
  wiredFieldSet({ error, data }) {
    if (data) {
      this.fieldSetData = data;
      this.error = undefined;
    } else if (error) {
      this.error = 'No fieldset found.';
      this.fieldSetData = undefined;
    }
  }

  get fields() {
    if (!this.fieldSetData || !this.objectInfo.data) {
      return [];
    }
    return this.fieldSetData.map(field => {
      return {
        ...field,
        value: getFieldValue(this.recordId, this.objectInfo.data.fields[field.apiName])
      };
    });
  }
}
