({
    init : function(component, event, helper){
        var action = component.get("c.getLocation");
        action.setParams({
            varObj: component.get("v.obj"),
            varLat: component.get("v.latField"),
            varLong: component.get("v.longField"),
            varName: component.get("v.nameField"),
            varDescText: component.get("v.descTextField"),
            varDescDate: component.get("v.descDateField")
        });
        action.setCallback(this, function(response){
            console.log('response'+response);
            var state = response.getState();
            console.log(state);
            if (state == 'SUCCESS'){
                var obj = response.getReturnValue();
                console.log(obj);
                component.set('v.mapMarkers', obj);
                component.set('v.zoomLevel', 16);
                component.set('v.markersTitle', 'Animal Locations');
                component.set('v.showFooter', false);
            }
        });
        $A.enqueueAction(action);
    },
    handleToggleChange : function(component, event, helper){
        var checked = component.get("v.checked");
        console.log(checked);
        if(checked){
            var selection = "visible";
        }else{
            var selection = "hidden";
        }
        component.set("v.listView", selection);
    }
})