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