import { LightningElement, api, wire, track } from 'lwc';
import getLocation from '@salesforce/apex/LocationController.getLocation';

export default class LightningLocationMap extends LightningElement {
    @api obj;
    @api latField;
    @api longField;
    @api nameField;
    @api descTextField;
    @api descDateField;
    @api zoomLevel = 16;
    @api markersTitle = 'Animal Locations';
    @api showFooter = false;
    @api mapTitle = 'Animal Locations';
    @track mapMarkers = [];
    @track listView = 'hidden';
    @track checked = false;

    connectedCallback() {
        this.initLocation();
    }

    initLocation() {
        getLocation({
            varObj: this.obj,
            varLat: this.latField,
            varLong: this.longField,
            varName: this.nameField,
            varDescText: this.descTextField,
            varDescDate: this.descDateField
        })
        .then(result => {
            console.log('result:', result);
            this.mapMarkers = result;
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }

    handleToggleChange(event) {
        this.checked = event.target.checked;
        this.listView = this.checked ? 'visible' : 'hidden';
    }
}