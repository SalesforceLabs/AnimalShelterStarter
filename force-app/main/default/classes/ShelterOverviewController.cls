public with sharing class ShelterOverviewController {

    @AuraEnabled(cacheable=true)
    public static List<LocationWrapper> getLocationHierarchy() {

        // Query all Locations
        Map<Id, animalshelters__Locations__c> locationMap = new Map<Id, animalshelters__Locations__c>(
            [SELECT Id, animalshelters__Name__c, animalshelters__Parent_Block__c, RecordType.Name 
             FROM animalshelters__Locations__c]
        );

        // Query all Movements (Animals assigned to Units)
        Map<Id, List<animalshelters__Animal__c>> unitAnimalMap = new Map<Id, List<animalshelters__Animal__c>>();
        for (animalshelters__Movement__c mov : [SELECT Id, animalshelters__Animal__r.Id, animalshelters__Animal__r.animalshelters__Animal_Name__c, animalshelters__Location__c 
                                 FROM animalshelters__Movement__c 
                                 WHERE animalshelters__Location__r.RecordType.Name = 'Unit']) {
            if (!unitAnimalMap.containsKey(mov.animalshelters__Location__c)) {
                unitAnimalMap.put(mov.animalshelters__Location__c, new List<animalshelters__Animal__c>());
            }
            unitAnimalMap.get(mov.animalshelters__Location__c).add(mov.animalshelters__Animal__r);
        }

        // Build hierarchy
        Map<Id, LocationWrapper> locationHierarchy = new Map<Id, LocationWrapper>();
        for (animalshelters__Locations__c loc : locationMap.values()) {
            LocationWrapper wrapper = new LocationWrapper(loc.Id, loc.animalshelters__Name__c, loc.RecordType.Name, loc.animalshelters__Parent_Block__c);
            locationHierarchy.put(loc.Id, wrapper);
        }

        // Assign children
        for (LocationWrapper loc : locationHierarchy.values()) {
            if (loc.parentId != null && locationHierarchy.containsKey(loc.parentId)) {
                locationHierarchy.get(loc.parentId).children.add(loc);
            }
        }

        // Assign animals to units
        for (Id unitId : unitAnimalMap.keySet()) {
            if (locationHierarchy.containsKey(unitId)) {
                locationHierarchy.get(unitId).animals = unitAnimalMap.get(unitId);
            }
        }

        // Return only top-level Sites
        List<LocationWrapper> result = new List<LocationWrapper>();
        for (LocationWrapper loc : locationHierarchy.values()) {
            if (loc.recordType == 'Site') {
                result.add(loc);
            }
        }

        return result;
    }

    public class LocationWrapper {
        @AuraEnabled public Id id;
        @AuraEnabled public String name;
        @AuraEnabled public String recordType;
        @AuraEnabled public Id parentId;
        @AuraEnabled public List<LocationWrapper> children = new List<LocationWrapper>();
        @AuraEnabled public List<animalshelters__Animal__c> animals = new List<animalshelters__Animal__c>();

        public LocationWrapper(Id id, String name, String recordType, Id parentId) {
            this.id = id;
            this.name = name;
            this.recordType = recordType;
            this.parentId = parentId;
        }
    }
}
