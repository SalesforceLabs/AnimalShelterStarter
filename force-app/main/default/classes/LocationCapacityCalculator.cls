public with sharing class LocationCapacityCalculator {

    @InvocableMethod(label='Calculate Location Capacity' description='Calculates the Total_Capacity and Available_Capacity for the Location hierarchy.')
    public static void calculateCapacity(List<Id> locationIds) {
        Set<Id> parentIdsToUpdate = new Set<Id>();
        List<animalshelters__Locations__c> locationsToUpdate = new List<animalshelters__Locations__c>();
        
        // Ensure we're only dealing with Unit record types.
        List<animalshelters__Locations__c> unitLocations = [SELECT Id, animalshelters__Parent_Block__c, animalshelters__Capacity__c, animalshelters__Allocation__c 
                                           FROM animalshelters__Locations__c 
                                           WHERE Id IN :locationIds 
                                           AND RecordType.DeveloperName = 'Unit'];

        // Gather parent Ids to process
        for (animalshelters__Locations__c loc : unitLocations) {
            if (loc.animalshelters__Parent_Block__c != null) {
                parentIdsToUpdate.add(loc.animalshelters__Parent_Block__c);
            }
        }
        
        // Process parent blocks recursively
        while (!parentIdsToUpdate.isEmpty()) {
            Set<Id> nextParentIds = new Set<Id>();
            List<animalshelters__Locations__c> parents = [SELECT Id, animalshelters__Parent_Block__c, RecordType.DeveloperName 
                                         FROM animalshelters__Locations__c 
                                         WHERE Id IN :parentIdsToUpdate];
            
            for (animalshelters__Locations__c parent : parents) {
                if (parent.RecordType.DeveloperName == 'Block' || parent.RecordType.DeveloperName == 'SubBlock' || parent.RecordType.DeveloperName == 'Site') {
                    // Aggregate child Units capacity and allocation
                    AggregateResult[] childAggregates = [SELECT SUM(animalshelters__Capacity__c) totalCapacity, SUM(animalshelters__Allocation__c) totalAllocation 
                                                         FROM animalshelters__Locations__c 
                                                         WHERE animalshelters__Parent_Block__c = :parent.Id 
                                                         AND RecordType.DeveloperName = 'Unit'];
                    
                    Decimal totalCapacity = 0;
                    Decimal totalAllocation = 0;
                    
                    // Check if the aggregate query returned results
                    if (!childAggregates.isEmpty()) {
                        totalCapacity = (Decimal)childAggregates[0].get('totalCapacity');
                        totalAllocation = (Decimal)childAggregates[0].get('totalAllocation');
                    }
                    
                    // Update the parent record with the new totals
                    parent.animalshelters__Total_Capacity__c = totalCapacity;
                    parent.animalshelters__Available_Capacity__c = totalCapacity - totalAllocation;
                    locationsToUpdate.add(parent);

                    // Add its parent to the next processing set
                    if (parent.animalshelters__Parent_Block__c != null) {
                        nextParentIds.add(parent.animalshelters__Parent_Block__c);
                    }
                }
            }
            // Move to next level in hierarchy
            parentIdsToUpdate = nextParentIds;
        }
        
        // Update all calculated locations
        if (!locationsToUpdate.isEmpty()) {
            update locationsToUpdate;
        }
    }
}