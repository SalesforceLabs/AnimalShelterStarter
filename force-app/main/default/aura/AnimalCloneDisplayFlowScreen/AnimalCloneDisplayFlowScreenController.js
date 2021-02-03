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
            {label:'Animal Name', fieldName: '%%%NAMESPACED_ORG%%%Animal_Name__c',type:'text', editable: 'true'},
            {label:'Primary Colour', fieldName: '%%%NAMESPACED_ORG%%%Colour__c',type:'text', editable: 'true'},
            {label:'Secondary Colour', fieldName: '%%%NAMESPACED_ORG%%%Secondary_Colour__c',type:'text', editable: 'true'},
            {label:'Gender', fieldName: '%%%NAMESPACED_ORG%%%Gender__c',type:'text', editable: 'true'},
            {label:'Date of Birth', fieldName: '%%%NAMESPACED_ORG%%%Date_of_Birth__c',type:'date', editable: 'true'},
            {label:'Crossbreed', fieldName: '%%%NAMESPACED_ORG%%%Crossbreed__c',type:'boolean', editable: 'true'},
            {label:'Coat Type', fieldName: '%%%NAMESPACED_ORG%%%Coat_Type__c',type:'text', editable: 'true'},
            {label:'Microchip or Tag', fieldName: '%%%NAMESPACED_ORG%%%Microchip__c',type:'text', editable: 'true'},
            {label:'Size', fieldName: '%%%NAMESPACED_ORG%%%Size__c',type:'text', editable: 'true'},
            {label:'Neutered/Spayed', fieldName: '%%%NAMESPACED_ORG%%%Neutered_Spayed__c',type:'boolean', editable: 'true'},
            {label:'Neutered/Spayed Date/Time', fieldName: '%%%NAMESPACED_ORG%%%Neutered_Spayed_Date_Time__c',type:'date', editable: 'true'},
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