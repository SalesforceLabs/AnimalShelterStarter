/**
 * @File Name          : FSCAnimalCloneDatatableHelper.js
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
	getData : function(cmp) {

        var action = cmp.get('c.getClonedAnimals');
        action.setCallback(this, function ( response ){

            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.mydata", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
		
	},

    showToast : function( strType, strMessage) {

        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            type: strType,
            message: strMessage,
            mode:'sticky'
        });
        toastEvent.fire();
    }

})