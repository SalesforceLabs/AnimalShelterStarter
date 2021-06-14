/**
 * @File Name          : FSCAnimalCloneDatatableHelper.js
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
	getData : function(cmp) {
        var action = cmp.get('c.getClonedActions');
        action.setCallback(this, $A.getCallback(function (response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var records =response.getReturnValue();
                cmp.set("v.mydata", records);
                cmp.set("v.mydataLength", response.getReturnValue().length);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
		
	},

    updateEditedValues: function(cmp, event) {
        var keyField = cmp.get("v.keyField");
        var data = cmp.get("v.mydata");
        var drafts = event.getParam('draftValues');

        // apply drafts to mydata
        data = data.map(item => {
            let draft = drafts.find(d => d[keyField] == item[keyField]);

            if (draft != undefined) {
                let fieldNames = Object.keys(draft);
                fieldNames.forEach(el => item[el] = draft[el]);
            }

            return item;
        });

        cmp.set("v.mydata", data);
    }
})