({
    init: function (cmp, event, helper) {
        cmp.set('v.mycolumns', [
            {label: 'Animal Name', fieldName: 'Animal_Name__c', type: 'text', editable: true},
            {label: 'Type', fieldName: 'Type__c', type: 'text' },
            {label: 'Breed', fieldName: 'Breed__c', type: 'text' },
            {label: 'Colour', fieldName: 'Colour__c', type: 'text', editable: true },
            {label: 'Secondary Colour', fieldName: 'Secondary_Colour__c', type: 'text', editable: true },
            {label: 'Gender', fieldName: 'Gender__c', type: 'text', editable: true},
            {label: 'Weight', fieldName: 'Current_Weight__c', type: 'number', editable: true },
            {label: 'Estimated Age', fieldName: 'Estimated_Age__c', type: 'number', editable: true },
            {label: 'Microchip', fieldName: 'Microchip__c', type: 'text', editable: true},
        ]);

    // Object Selection
    cmp.set('v.mydata', cmp.get('v.mydataAnimal'));
    cmp.set('v.preSelection', cmp.get('v.selectedRowsAnimal'));
    console.log(cmp.get('v.mydata'));
     
    // Pre-selected Rows
    var rows = cmp.get('v.preSelection');
    var list = [];
    for (var i=0, len = rows.length; i < len; i++) {
        list.push(rows[i].Id);
    }
    cmp.set('v.preSelectedIds', list);

    // Save pre-edit data
    cmp.set('v.saveMydata', cmp.get('v.mydata'));
},

// Return Selected Table Rows
getSelectedName: function (cmp, event) {
    //save the selected rows into a flow-accessible attribute
    var selectedRows = event.getParam('selectedRows');
    cmp.set("v.selectedRowsAnimal", selectedRows);
},


handleSave: function(cmp, event, helper) {
    helper.updateEditedValues(cmp, event);
        // Clear Buttons from the Table
        cmp.find('ASDatatable').set('v.draftValues', null);
        // Save current table data values
        cmp.set('v.saveMydata', cmp.get('v.mydata'));
},

cancelChanges: function (cmp, event, helper) {
    // Clear Buttons from the Table
    cmp.find('ASDatatable').set('v.draftValues', null);
    // Replace current table data values with the saved values
    cmp.set('v.mydata', cmp.get('v.saveMydata'));
},    

})