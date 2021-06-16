/**
 * @File Name          : FSCAnimalCloneDatatableController.js
 * @Description        : 
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 26/02/2021, 10:00:00 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    26/02/2020   Chris Rolfe (Salesforce.org)     Initial Version
**/

({
	init: function(cmp, event, helper) {

        cmp.set('v.columns', [
            {label: 'Animal Name', fieldName: '%%%NAMESPACED_ORG%%%Animal_Name__c', type: 'text', editable: true, initialWidth: 150},
            {label: 'Primary Colour', fieldName: '%%%NAMESPACED_ORG%%%Colour__c', type: 'text', editable: true, initialWidth: 150 },
            {label: 'Sec. Colour', fieldName: '%%%NAMESPACED_ORG%%%Secondary_Colour__c', type: 'text', editable: true, initialWidth: 150 },
            {label: 'Gender', fieldName: '%%%NAMESPACED_ORG%%%Gender__c', type: 'text', editable: true, initialWidth: 100},
            {label: 'Weight', fieldName: '%%%NAMESPACED_ORG%%%Current_Weight__c', type: 'number', editable: true, initialWidth: 100 },
            {label: 'Est. Age', fieldName: '%%%NAMESPACED_ORG%%%Estimated_Age__c', type: 'number', editable: true, initialWidth: 100 },
            {label: 'Microchip', fieldName: '%%%NAMESPACED_ORG%%%Microchip__c', type: 'text', editable: true, initialWidth: 150},
        ]);
        helper.getData(cmp);

},


handleSave: function(cmp, event, helper) {

    var updatedRecords = cmp.find( "ASDatatable" ).get( "v.draftValues" );
    var action = cmp.get( "c.updateRecords" );
    action.setParams({

        'updatedAnimalList' : updatedRecords
    });
    action.setCallback( this, function( response ){

        var state = response.getState();
        if ( state === "SUCCESS" ) {
            if ( response.getReturnValue() === true) {
                helper.toastMsg( 'success', 'Records Saved Successfully' );
                cmp.find( " ASDatatable" ).set( "v.draftValues",null );

            } else {
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );

            }
        } else {
            helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );
        }
    });
    $A.enqueueAction( action );


}

})