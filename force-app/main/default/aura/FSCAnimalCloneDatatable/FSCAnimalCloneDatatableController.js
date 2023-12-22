/**
 * @File Name          : FSCAnimalCloneDatatableController.js
 * @Description        :
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              :
 * @Last Modified By   : Stewart Anderson
 * @Last Modified On   : 12-15-2023
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    16/06/2020   Chris Rolfe (Salesforce.org)     Initial Version
**/

({
	init: function(cmp, event, helper) {

        cmp.set('v.columns', [
            {label: 'Animal Name', fieldName: 'animalshelters__Animal_Name__c', type: 'text', editable: true, initialWidth: 150},
            {label: 'Primary Colour', fieldName: 'animalshelters__Colour__c', type: 'text', editable: true, initialWidth: 150 },
            {label: 'Sec. Colour', fieldName: 'animalshelters__Secondary_Colour__c', type: 'text', editable: true, initialWidth: 150 },
            {label: 'Gender', fieldName: 'animalshelters__Gender__c', type: 'text', editable: true, initialWidth: 100},
            {label: 'Weight', fieldName: 'animalshelters__Current_Weight__c', type: 'number', editable: true, initialWidth: 100 },
            {label: 'Est. Age', fieldName: 'animalshelters__Estimated_Age__c', type: 'number', editable: true, initialWidth: 100 },
            {label: 'Microchip', fieldName: 'animalshelters__Microchip__c', type: 'text', editable: true, initialWidth: 150},
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