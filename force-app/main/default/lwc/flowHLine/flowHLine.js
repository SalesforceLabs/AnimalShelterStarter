import { LightningElement, api } from 'lwc';

export default class FlowHLine extends LightningElement {

    @api marginTop;
    @api marginBottom;
    @api thickness='';
    @api color;
    @api vCard;

    get classMarginTop(){
        return (this.marginTop) ? this.marginTop : 'none';
    }

    get classMarginBottom(){
        return (this.marginBottom) ? this.marginBottom : 'xx-small';
    }

    get styleThickness(){
        return (this.thickness) ? this.thickness : '1px';
    }

    get styleColor(){
        return (this.color) ? this.color : '#808080';
    }

    get sldsClass(){
        return `slds-m-top_${this.classMarginTop} slds-m-bottom_${this.classMarginBottom}`;
    }

    get lineStyle(){
        return `border-width: ${this.styleThickness};border-color: ${this.styleColor};`;
    }

    get displayVCard(){
        return (this.vCard === true) ? true : false;
    }
}