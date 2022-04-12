({
	getData : function(cmp) {
        var action = cmp.get('c.getAnimalActions');
        action.setParams({
            recId: cmp.get("v.recordId"),
            rTypeName: cmp.get("v.recordTypeName")
        });
        action.setCallback(this, $A.getCallback(function (response){
            var state = response.getState();
            if (state === "SUCCESS") {
                //cmp.set("v.mydata", response.getReturnValue());
                var records =response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                    if(record.%%%NAMESPACED_ORG%%%Action_Completed__c){
                            record.showClass = (record.%%%NAMESPACED_ORG%%%Action_Completed__c === true ? 'redcolor' : 'blackcolor');
                            record.displayIconName = 'utility:check';  
                        }
                        else{
                            record.showClass = (record.%%%NAMESPACED_ORG%%%Action_Completed__c === false ? 'blackcolor' : 'redcolor');
                            record.displayIconName = 'utility:close';     
                        }
                });
                cmp.set("v.mydata", records);
                cmp.set("v.mydataLength", response.getReturnValue().length);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
		
	}
})
