/*
MIT License

Copyright (c) 2020 Playground, https://www.playg.app

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
import { LightningElement, api, track } from 'lwc';

export default class LightningVisualPicker extends LightningElement {
    @api show = false;
    @api header;
    @api options = [];
    @api size = 'medium';
    @api vertical;
    @api multiSelect = false;
    @api context;

    @track items = [];
    @track pickerClass;
    @track pickerType;
    @track labelCss;

    selectedValue;

    renderedCallback() {
        if (this.show) {
            if (this.multiSelect) {
                this.selectedValue = [];
            }
            //set style & size of picker
            if (this.vertical) {
                this.pickerClass = 'slds-visual-picker slds-visual-picker_vertical';
                this.labelCss = 'slds-visual-picker__figure slds-visual-picker__text slds-align_absolute';
            } else {
                this.pickerClass = 'slds-visual-picker slds-visual-picker_' + this.size;
                this.labelCss = 'slds-visual-picker__figure slds-visual-picker__text slds-align_absolute-center';
            }

            //set type of picker
            if (this.multiSelect) {
                this.pickerType = 'checkbox';
            } else {
                this.pickerType = 'radio';
            }

            if (this.options.length > 0
                && this.options.length != this.items.length) {
                let iterator = 0;
                let items = [];
                this.options.forEach(option => {
                    let item = { ...option };
                    item.id = 'visual-picker-' + iterator;
                    items.push(item);
                    iterator++;
                });
                this.items = items;
            }
        }
    }

    handleChange(event) {
        if (this.multiSelect) {
            if (event.target.checked) {
                this.selectedValue.push(event.target.value);
            } else {
                this.selectedValue.splice(this.selectedValue.indexOf(event.target.value), 1);
            }
        } else {
            this.selectedValue = event.target.value;
        }
        this.dispatchEvent(new CustomEvent('pickerselect', { detail: { context: this.context, selectedValue: this.selectedValue } }));
    }
}