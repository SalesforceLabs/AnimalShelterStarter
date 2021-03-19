({
    getLocation : function(component, event){
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition(success);
            function success(position){
                var currLat = position.coords.latitude;
                component.set("v.latitude", currLat);
                var currLong = position.coords.longitude;
                component.set("v.longitude", currLong);
                console.log("CurrentLocation: " + currLat + "," + currLong);
            }
        } else {
            error('Geolocation Not available, check device settings');
        }
    }
})