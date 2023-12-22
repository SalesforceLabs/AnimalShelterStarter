/**
 * @File Name          : AnimalActionRelatedList2Controller.js
 * @Description        :
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              :
 * @Last Modified By   : Stewart Anderson
 * @Last Modified On   : 12-15-2023
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    07/05/2020   Chris Rolfe (Salesforce.org)     Initial Version
**/
({
	init: function(cmp, event, helper) {
        helper.getData(cmp);

        cmp.set('v.mycolumns', [
            {label: 'Action Link', fieldName: 'linkName', type: 'url', typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}, sortable: true},
            {label: 'Description', fieldName: 'animalshelters__Description__c', type: 'text'},
            {label: 'Date/Time of Action', fieldName: 'animalshelters__Date_Time_of_Action__c', type: 'date'},
            {
                "label": "Completed",
                "fieldName": "animalshelters__Action_Completed__c",
                "cellAttributes": {
                    "class": {
                        "fieldName": "showClass"
                    },
                    "iconName": {
                        "fieldName": "displayIconName"
                    }
                }
            },
        ]);
    },
    redirectToSobject: function(cmp, event) {
        var selectedItem = event.currentTarget;
        var IdP = selectedItem.dataset.record;

        if ((typeof sforce != 'undefined') && sforce && (!!sforce.one))
            sforce.one.navigateToSObject(IdP);
        else{
            location.href = '/lightning/r/animalshelters__Animal_Action__c/'+ IdP +'/view';
        }
    }
})