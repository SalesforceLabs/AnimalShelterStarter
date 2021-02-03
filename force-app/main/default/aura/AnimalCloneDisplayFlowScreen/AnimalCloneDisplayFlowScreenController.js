/**
*   @Filename          : AnimalCloneDisplayFlowScreenController.js
*   @Description       : Flow component using datatable to display Cloned animal records for update
*   @Author            : Chris Rolfe (Salesforce.org)
*   @Group             :
*   @Last Modified By  : Chris Rolfe (Salesforce.org)
*   @Last Modified On  : 4/20/2020, 11:22:04 AM
*   @Modifcation Log   :
*   Ver      Date             Author             Modification
*   1.0    4/20/2020     Chris Rolfe (Salesforce.org)      Initial Version
**/
({
	init  : function(component, event, helper) {
        component.set('v.columns',[
            {label:'Animal Name', fieldName: 'animalshelter__Animal_Name__c',type:'text', editable: 'true'},
            {label:'Primary Colour', fieldName: 'animalshelter__Colour__c',type:'text', editable: 'true'},
            {label:'Secondary Colour', fieldName: 'animalshelter__Secondary_Colour__c',type:'text', editable: 'true'},
            {label:'Gender', fieldName: 'animalshelter__Gender__c',type:'text', editable: 'true'},
            {label:'Date of Birth', fieldName: 'animalshelter__Date_of_Birth__c',type:'date', editable: 'true'},
            {label:'Crossbreed', fieldName: 'animalshelter__Crossbreed__c',type:'boolean', editable: 'true'},
            {label:'Coat Type', fieldName: 'animalshelter__Coat_Type__c',type:'text', editable: 'true'},
            {label:'Microchip or Tag', fieldName: 'animalshelter__Microchip__c',type:'text', editable: 'true'},
            {label:'Size', fieldName: 'animalshelter__Size__c',type:'text', editable: 'true'},
            {label:'Neutered/Spayed', fieldName: 'animalshelter__Neutered_Spayed__c',type:'boolean', editable: 'true'},
            {label:'Neutered/Spayed Date/Time', fieldName: 'animalshelter__Neutered_Spayed_Date_Time__c',type:'date', editable: 'true'},
        ]);
    },
    updateSelectedAnimals : function(component, event, helper){
        var selectedAnimals = event.getParam('selectedRows');
       cmp.set('v.selectedRowsCount', selectedAnimals.length);
    },
    handleSaveEdition: function (cmp, event, helper) {
        var draftValues = event.getParam('draftValues');
        component.set('v.selectedAnimals', draftValues);
    },
})