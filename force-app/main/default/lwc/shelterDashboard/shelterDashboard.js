import { LightningElement, wire, track } from 'lwc';
import getUnitLocations from '@salesforce/apex/ShelterDashboard.getUnitLocations';

export default class ShelterDashboard extends LightningElement {
    @track records;
    @track error;

    @wire(getUnitLocations)
    wiredLocations({ error, data }){
        if (data) {
            console.log('Data Returned: ', data);
            this.records = data.map(record => {
                return {
                    ...record,
                    RecordId: record.Id,
                    LocationName: record.Name__c,
                    LocationParentBlockName: record.Parent_Block_Name__c,
                   // AnimalName: record.animalshelters__Internal_Animal_Lookup__r ? record.animalshelters__Internal_Animal_Lookup__r.animalshelters__Animal_Name__c : ' ',
                   // AnimalStatus: record.animalshelters__Internal_Animal_Lookup__r ? record.animalshelters__Internal_Animal_Lookup__r.animalshelters__Animal_Status__c : ' '
                };
                console.log('Mapped Data: ', records);
            });
        } else if (error) {
            console.log('Error Returned: ', error);
        }
    }
}