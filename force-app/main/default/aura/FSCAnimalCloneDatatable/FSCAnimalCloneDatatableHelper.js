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