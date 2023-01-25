/**
 * @File Name          : FSC_FileUploadPreviewHelper.js
 * @Description        : 
 * @Author             : Chris Rolfe (Salesforce)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce)
 * @Last Modified On   : 25/01/2023, 10:00:00 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    25/01/2023   Chris Rolfe (Salesforce)     Initial Version
**/
({  
    getUploadedFiles : function(component, event){
        var action = component.get("c.getFiles");  
        action.setParams({  
            "recordId": component.get("v.recordId") 
        });      
        action.setCallback(this,function(response){  
            var state = response.getState();  
            if(state=='SUCCESS'){  
                var result = response.getReturnValue();           
                component.set("v.files",result);  
            }  
        });  
        $A.enqueueAction(action);  
    },
    
    deleteUploadedFile : function(component, event) {  
        var action = component.get("c.deleteFile");           
        action.setParams({
            "contentDocumentId": event.currentTarget.id            
        });  
        action.setCallback(this,function(response){  
            var state = response.getState();  
            if(state=='SUCCESS'){  
                this.getUploadedFiles(component);
                component.set("v.showSpinner", false); 
                // show toast on file deleted successfully
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "message": "File has been deleted successfully!",
                    "type": "success",
                    "duration" : 2000
                });
                toastEvent.fire();
            }  
        });  
        $A.enqueueAction(action);  
    },  
 })