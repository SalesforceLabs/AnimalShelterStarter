/**
 * @File Name          : AnimalActionRelatedList2Controller.js
 * @Description        : 
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 07/05/2020, 10:30:00 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    07/05/2020   Chris Rolfe (Salesforce.org)     Initial Version
**/
({
	init: function(cmp, event, helper) {
        helper.getData(cmp);
        
        cmp.set('v.mycolumns', [
            {label: 'Action Link', fieldName: 'linkName', type: 'url', typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}, sortable: true},
            {label: 'Description', fieldName: 'Description__c', type: 'text'},
            {label: 'Date/Time of Action', fieldName: 'Date_Time_of_Action__c', type: 'date'},
            {
                "label": "Completed",
                "fieldName": "%%%NAMESPACED_ORG%%%Action_Completed__c",
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
            location.href = '/lightning/r/%%%NAMESPACED_ORG%%%Animal_Action__c/'+ IdP +'/view';
        }
    }
})