/**
 * @File Name          : FSCAnimalCloneDatatableController.js
 * @Description        : 
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 16/06/2021, 10:00:00 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    16/06/2020   Chris Rolfe (Salesforce.org)     Initial Version
**/

({
	init: function(cmp, event, helper) {

        cmp.set('v.columns', [
            {label: 'Animal Name', fieldName: 'Animal_Name__c', type: 'text', editable: true, initialWidth: 150},
            {label: 'Primary Colour', fieldName: 'Colour__c', type: 'text', editable: true, initialWidth: 150 },
            {label: 'Sec. Colour', fieldName: 'Secondary_Colour__c', type: 'text', editable: true, initialWidth: 150 },
            {label: 'Gender', fieldName: 'Gender__c', type: 'text', editable: true, initialWidth: 100},
            {label: 'Weight', fieldName: 'Current_Weight__c', type: 'number', editable: true, initialWidth: 100 },
            {label: 'Est. Age', fieldName: 'Estimated_Age__c', type: 'number', editable: true, initialWidth: 100 },
            {label: 'Microchip', fieldName: 'Microchip__c', type: 'text', editable: true, initialWidth: 150},
        ]);
        helper.getData(cmp);

},


handleSave: function(cmp, event, helper) {

    var updatedRecords = cmp.find( "ASDatatable" ).get( "v.draftValues" );
    var action = cmp.get( "c.updateClonedRecords" );
    action.setParams({

        'updatedAnimalList' : updatedRecords
    });
    action.setCallback( this, function( response ){

        var state = response.getState();
        if ( state === "SUCCESS" ) {
            helper.showToast("success", "Records Saved Successfully");
            cmp.find( "ASDatatable" ).set( "v.draftValues",null );
        } else {
            helper.showToast("error", "Something went wrong. Contact your system administrator.");
        }
    });
    $A.enqueueAction( action );


}

})