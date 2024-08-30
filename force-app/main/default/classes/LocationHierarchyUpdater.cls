public class LocationHierarchyUpdater {

    @InvocableMethod(label='Update Location Hierarchy' description='Updates the Total_Capacity and Total_Availability for parent Locations based on the updated Unit Location')
    public static void updateLocationHierarchy(List<Id> locationIds) {
        System.debug('Location Id: ' + locationIds);
        // Use a Set to avoid duplicate parent location IDs
        Set<Id> parentLocationIds = new Set<Id>();

        // Query all Unit locations in bulk to get their parent location IDs
        List<animalshelters__Locations__c> unitLocations = [
            SELECT Id, animalshelters__Parent_Block__c
            FROM animalshelters__Locations__c
            WHERE Id IN :locationIds
        ];

        // Collect all unique parent location IDs
        for (animalshelters__Locations__c unit : unitLocations) {
            if (unit.animalshelters__Parent_Block__c != null) {
                parentLocationIds.add(unit.animalshelters__Parent_Block__c);
            }
        }

        // If there are parent locations, update their totals
        if (!parentLocationIds.isEmpty()) {
            updateParentTotals(parentLocationIds);
        }
    }

    private static void updateParentTotals(Set<Id> parentLocationIds) {
        // Use a Map to store parent locations and their child Unit's capacities and allocations
        Map<Id, AggregateResult> parentCapacityMap = new Map<Id, AggregateResult>();

        // Query all child Units in bulk to get their capacity and allocation totals
        AggregateResult[] capacityResults = [
            SELECT animalshelters__Parent_Block__c parentId, SUM(animalshelters__Capacity__c) totalCapacity, SUM(animalshelters__Allocation__c) totalAllocation
            FROM animalshelters__Locations__c
            WHERE animalshelters__Parent_Block__c IN :parentLocationIds
            AND RecordType.Name = 'Unit'
            GROUP BY animalshelters__Parent_Block__c
        ];

        // Store the results in the map
        for (AggregateResult result : capacityResults) {
            parentCapacityMap.put((Id)result.get('parentId'), result);
        }

        // Prepare a list to hold updates for parent locations
        List<animalshelters__Locations__c> locationsToUpdate = new List<animalshelters__Locations__c>();

        // Query the parent locations to update their totals
        List<animalshelters__Locations__c> parentLocations = [
            SELECT Id, RecordType.Name, animalshelters__Parent_Block__c
            FROM animalshelters__Locations__c
            WHERE Id IN :parentLocationIds
        ];

        for (animalshelters__Locations__c parent : parentLocations) {
            if (parentCapacityMap.containsKey(parent.Id)) {
                AggregateResult result = parentCapacityMap.get(parent.Id);
                Decimal totalCapacity = (Decimal) result.get('totalCapacity');
                Decimal totalAllocation = (Decimal) result.get('totalAllocation');
                Decimal totalAvailability = totalCapacity - totalAllocation;

                // Update the parent location's totals
                parent.animalshelters__Total_Capacity__c = totalCapacity;
                parent.animalshelters__Available_Capacity__c = totalAvailability;
                System.debug('Total Capacity ' + totalCapacity);
                System.debug('Total Availability: ' + totalAvailability);
                locationsToUpdate.add(parent);
                
            }
        }

        // Perform the update in bulk
        if (!locationsToUpdate.isEmpty()) {
            update locationsToUpdate;
        }

        // If there are further parent locations, update their totals recursively
        Set<Id> grandparentLocationIds = new Set<Id>();
        for (animalshelters__Locations__c parent : parentLocations) {
            if (parent.animalshelters__Parent_Block__c != null) {
                grandparentLocationIds.add(parent.animalshelters__Parent_Block__c);
            }
        }

        if (!grandparentLocationIds.isEmpty()) {
            updateParentTotals(grandparentLocationIds);
        }
    }
}