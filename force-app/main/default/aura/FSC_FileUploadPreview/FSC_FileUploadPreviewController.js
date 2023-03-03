/**
 * @File Name          : FSC_FileUploadPreviewController.js
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
    doInit : function(component, event, helper){  
       helper.getUploadedFiles(component, event);
    },      
    
    previewFile : function(component, event, helper){  
        $A.get('e.lightning:openFiles').fire({ 
            recordIds: [event.currentTarget.id]
        });  
    },  
    
    uploadFinished : function(component, event, helper) {  
        helper.getUploadedFiles(component, event);    
        var toastEvent = $A.get("e.force:showToast");
        // show toast on file uploaded successfully 
        toastEvent.setParams({
            "message": "Files have been uploaded successfully!",
            "type": "success",
            "duration" : 2000
        });
        toastEvent.fire();
    }, 
    
    deleteFile : function(component, event, helper){
        if( confirm("Confirm deleting this file?")){
            component.set("v.showSpinner", true); 
            helper.deleteUploadedFile(component, event);                
        }
    }
 })