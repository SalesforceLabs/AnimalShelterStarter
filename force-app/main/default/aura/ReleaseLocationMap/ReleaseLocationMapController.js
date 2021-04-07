({
    init : function(component, event, helper){
        var action = component.get("c.getReleaseLocation");
        action.setCallback(this, function(response){
            console.log('response'+response);
            var state = response.getState();
            console.log(state);
            if (state == 'SUCCESS'){
                var obj = response.getReturnValue();
                console.log(obj);
                component.set('v.mapMarkers', obj);
                component.set('v.zoomLevel', 16);
                component.set('v.markersTitle', 'Release Locations');
                component.set('v.showFooter', false);
            }
        });
        $A.enqueueAction(action);
    }
})