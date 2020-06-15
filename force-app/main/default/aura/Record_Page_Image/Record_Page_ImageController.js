({  
    // Load current profile picture
    onInit: function(component) {
        var action = component.get("c.getProfilePicture"); 
        action.setParams({
            parentId: component.get("v.recordId"),
        });
        action.setCallback(this, function(a) {
            var attachment = a.getReturnValue();
            console.log(attachment);
            if (attachment && attachment.Id) {
                component.set('v.pictureSrc', '/servlet/servlet.FileDownload?file='
                                                  + attachment.Id);
            }
        });
        $A.enqueueAction(action); 
    },
     
    onDragOver: function(component, event) {
        event.preventDefault();
    },
    
    toggleButton : function(component, event, helper) {
        var label = component.get("v.ImageHelpButtonLabel");
        if(label == 'Show Help'){
            component.set("v.ImageHelpButtonLabel","Hide Help");
            component.set("v.ToggleAreaClass","");
        }else {
            component.set("v.ImageHelpButtonLabel","Show Help");
            component.set("v.ToggleAreaClass","slds-hide");
        }
    },
 
    onDrop: function(component, event, helper) {
        event.stopPropagation();
        event.preventDefault();
        event.dataTransfer.dropEffect = 'copy';
        var files = event.dataTransfer.files;
        if (files.length>1) {
            return alert("You can only upload one profile picture");
        }
        helper.readFile(component, helper, files[0]);
    }
     
})