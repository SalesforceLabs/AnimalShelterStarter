/**
 * @description       : Displays a Chart of Animal Current Weight changes
 * @author            : Chris Rolfe
 * @group             :
 * @last modified on  : 03-15-2023
 * @last modified by  : Chris Rolfe
**/
import { LightningElement, api, wire, track } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import chartjs from '@salesforce/resourceUrl/chartjs280';
import getWeightHistory from '@salesforce/apex/AnimalHistoryWeightController.getWeightHistory';

export default class AnimalHistoryWeightChart extends LightningElement {
    @api recordId;
    @api numberOfDays;
    @track chartjsInitialized = false;
    chart;

    @wire(getWeightHistory, { recordId: '$recordId', noOfDays: '$numberOfDays' })
    weightHistory({ error, data }) {
        if (data) {
            console.log(JSON.stringify(data));
            let dates = data.map(record => record.cwDate);
            let weights = data.map(record => record.cwWeight);
            this.renderChart(dates, weights);
        } else if (error) {
            // Handle error
            console.error('Error:', error);
        }
    }

    renderedCallback() {
        if (this.chartjsInitialized) {
            return;
        }
        this.chartjsInitialized = true;

        Promise.all([
            loadScript(this, chartjs)])
            .then(() => {
                this.renderChart();
            })
            .catch(error => {
                console.error('Error loading ChartJS', error);
            });
    }

    renderChart(dates, weights) {
        const ctx = this.template.querySelector('canvas').getContext('2d');
        this.chart = new window.Chart(ctx, {
            type: 'line',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Weight',
                    data: weights,
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }]
            }
        });
    }
}