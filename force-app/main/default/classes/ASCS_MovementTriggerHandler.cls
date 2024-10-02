public with sharing class ASCS_MovementTriggerHandler {
    // Method to handle logic after insert

    public static void handleInsert(Map<Id, animalshelters__Movement__c> newMap) {
        
        // Check if the allocation toggle is set:
        // Return out if allocation enabled is false
        // ASCS_Allocation_Toggle__c toggle = ASCS_Allocation_Toggle__c.getOrgDefaults();
        // Boolean toggleValue = Boolean.valueOf(toggle.get('ASCS_Allocation_Enabled__c'));
        // if(toggleValue == false) return;

        // Create a list(Incase more than one movement is created) of Location Ids to pass through to updateMovementCount function
        List<String> locationList = new List<String>();

        // Loop incase of bulk upload
        for (animalshelters__Movement__c movement : newMap.values()) {
            // Make sure the new movement value is current
            if(movement.animalshelters__Current__c == true && movement.animalshelters__Location__c != null){
                // Add to Location List, for proccessing
            locationList.add(movement.animalshelters__Location__c);
            }
        }
        updateMovementCount(locationList);
    }

    // Method to handle logic after update
    public static void handleUpdate(Map<Id, animalshelters__Movement__c> newMap, Map<Id, animalshelters__Movement__c> oldMap) {
        
        // Return out if allocation enables is false
        // ASCS_Allocation_Toggle__c toggle = ASCS_Allocation_Toggle__c.getOrgDefaults();
        // Boolean toggleValue = Boolean.valueOf(toggle.get('ASCS_Allocation_Enabled__c'));
        // System.debug('Toggle' + toggleValue);
        // if(toggleValue == false) return;
        
        // Create List of Locations 
        //Create Lost of Location Id Strings
        List<String> locationIdStringList = new List<String>();
        
        // Loop incase of bulk movement creation
        for (Id movementId : newMap.keySet()) {
            animalshelters__Movement__c newMovement = newMap.get(movementId);
            animalshelters__Movement__c oldMovement = oldMap.get(movementId);
            // Pull current value from new and onld map
            Boolean oldCurrentValue = Boolean.valueOf(oldMovement.get('animalshelters__Current__c'));
            Boolean newCurrentValue = Boolean.valueOf(newMovement.get('animalshelters__Current__c'));
            
            // Check that the movement current value has been changed
            if(oldCurrentValue != newCurrentValue){
                // Add to location string list
                String newLocation = String.valueOf(newMovement.get('animalshelters__Location__c'));
                if(newLocation != null){
                    locationIdStringList.add(newLocation);
                }
            }
        }
       updateMovementCount(locationIdStringList);
    }

    // Method to pass in locationId List that updates the allocation based on movement count
    public static void updateMovementCount(List<String> locationIdStringList) {
        Map<String, Integer> movementCount = new Map<String, Integer>();
        List<animalshelters__Locations__c> locationList = new List<animalshelters__Locations__c>();

        // Perform the aggregate query to get count of movements per location
        List<AggregateResult> results = [
            SELECT animalshelters__Location__c, COUNT(Id)
            FROM animalshelters__Movement__c
            WHERE animalshelters__Location__c IN :locationIdStringList AND animalshelters__Current__c = true
            GROUP BY animalshelters__Location__c
        ];
    
        // Loop through the results and populate the map
        for (AggregateResult result : results) {
            String locationId = (String)result.get('animalshelters__Location__c');
            Integer count = (Integer)result.get('expr0');
            
            // Create temp location to update the allocation
            animalshelters__Locations__c tempLocation = new animalshelters__Locations__c();
            tempLocation.Id = locationId;
            tempLocation.animalshelters__Allocation__c = count;
            locationList.add(tempLocation);
            // Add to map
            movementCount.put(locationId, count);
        }

        // Now handle locations that were not found in the query results
        for (String locationId : locationIdStringList) {
            // If the locationId is not present in the results, add it with an allocation of 0
            if (!movementCount.containsKey(locationId)) {
                // Create a temp location with allocation 0
                animalshelters__Locations__c tempLocation = new animalshelters__Locations__c();
                tempLocation.Id = locationId;
                tempLocation.animalshelters__Allocation__c = 0;
                locationList.add(tempLocation);
            }
        }
        update locationList;
    }
}