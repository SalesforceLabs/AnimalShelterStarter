/**
 * @File Name          : AlertBannerController.js
 * @Description        : 
 * @Author             : Stewart Anderson (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Stewart Anderson (Salesforce.org)
 * @Last Modified On   : 4/7/2020, 8:57:28 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/7/2020   Stewart Anderson (Salesforce.org)     Initial Version
**/
({
	doInit: function(component, event, helper) { 
        
        //Get Animal Alert Records
        var action = component.get("c.getRelatedAlertRecords");
        action.setParams({
            parentId: component.get("v.recordId"),
        });
        
        action.setCallback(this, function(response) {
            
            //Handle Response
            if (response.getState() === "SUCCESS") {
                
                var AnimalBoxDiv = component.find("AlertBox");
                var AnimalAlertList = response.getReturnValue(); 
                component.set("v.intAnimalAlertsSize",AnimalAlertList.length);
                
                if(AnimalAlertList.length > 0){
                    component.set("v.lstAnimalAlerts",response.getReturnValue());
                    $A.util.removeClass(component.find("AlertBox"), "slds-hide");
                    $A.util.addClass(component.find("AlertBox"), "AnimalAlertClass");
                }
               
            } 
            else if (state == "ERROR") {
                
                //Handle Error
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator, there was an error retrieving animal alerts related to this record."
                });
                toastEvent.fire();
            }    
        });
        
        $A.enqueueAction(action);
    }
})