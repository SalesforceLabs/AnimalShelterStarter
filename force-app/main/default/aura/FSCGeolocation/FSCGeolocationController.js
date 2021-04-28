({
    
    init : function(component, event, helper) {
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition(success);
            function success(position){
                var currLat = position.coords.latitude;
                component.set("v.latitude", currLat);
                var currLong = position.coords.longitude;
                component.set("v.longitude", currLong);
                console.log("CurrentLocation: " + currLat + "," + currLong);
                
                var marker = "";
                var marker = '[{"location": { "Latitude": "' + currLat + '","Longitude": "' + currLong + '"}}]';
                console.log("Marker Data: " + marker);
                component.set("v.mapMarkersData", JSON.parse(marker));
               
            }
        } else {
            error('Geolocation Not available, check device settings');
        }
    }
})