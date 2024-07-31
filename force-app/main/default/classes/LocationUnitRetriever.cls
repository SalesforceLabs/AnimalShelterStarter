public with sharing class LocationUnitRetriever {
    @InvocableMethod(label='Find Unit Records' description='Find Unit records under a given Location record')

    public static List<Id> getUnitRecords(List<Id> recordIds) {
        // Ensure there's only one ID passed
        if(recordIds == null || recordIds.isEmpty() || recordIds.size() != 1) {
            return new List<Id>();
        }

        Id locationId = recordIds[0];
        
        // Get the RecordType Developer Names for comparison
        Map<Id, String> recordTypeMap = new Map<Id, String>();
        for (RecordType rt : [SELECT Id, DeveloperName FROM RecordType WHERE SObjectType = 'animalshelters__Locations__c']){
            recordTypeMap.put(rt.Id, rt.DeveloperName);
        }

        // Get the starting location record
        animalshelters__Locations__c startLocation = [SELECT Id, RecordTypeId, Parent_Block__c FROM animalshelters__Locations__c WHERE Id = :locationId LIMIT 1];

        String startRecordType = recordTypeMap.get(startLocation.RecordTypeId);
        Set<Id> unitIds = new Set<Id>();

        // Fund unit records based on the starting location's recordType
        if (startRecordType == 'Site') {
            // Traverse from Site to Blocks and SubBlocks to Units
            List<animalshelters__Locations__c> blocks = [SELECT Id FROM animalshelters__Locations__c WHERE Parent_Block__c = :startlocation.Id AND RecordTypeId = :recordTypeMap.get('Block')];
            for (animalshelters__Locations__c block : blocks) {
                unitIds.addAll(findUnitsUnderLocation(block.Id, recordTypeMap));
            }
        } else if (startRecordType == 'Block') {
            // Traverse from Block to SubBlocks to Units
            unitIds.addAll(findUnitsUnderLocation(startLocation.Id, recordTypeMap));
        } else if (startRecordType == 'SubBlock') {
            // Traverse from SubBlock to Units
            unitIds.addAll(findUnitsUnderLocation(startLocation.Id, recordTypeMap));
        } else if (startRecordType == 'Unit') {
            // If it's already a Unit, just add thsi ID
            unitIds.add(startLocation.Id);
        }

        return new List<Id>(unitIds);
    }

    private static Set<Id> findUnitsUnderLocation(Id locationId, Map<Id, String> recordTypeMap){
        Set<Id> unitIds = new Set<Id>();
        List<animalshelters__Locations__c> childLocations = [SELECT Id, RecordTypeId FROM animalshelters__Locations__c WHERE Parent_Block__c = :locationId];

        for (animalshelters__Locations__c childLocation : childLocations) {
            String childRecordType = recordTypeMap.get(childLocation.RecordTypeId);
            if (childRecordType == 'Unit') {
                unitIds.add(childLocation.Id);
            } else if (childRecordType == 'SubBlock') {
                unitIds.addAll(findUnitsUnderLocation(childLocation.Id, recordTypeMap));
            }
        }

        return unitIds;
    }
}