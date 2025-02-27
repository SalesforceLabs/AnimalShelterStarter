public with sharing class AnimalShelterOverviewController {

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getSites() {
        return [SELECT Id, animalshelters__Name__c FROM animalshelters__Locations__c WHERE RecordType.DeveloperName = 'Site' ORDER BY animalshelters__Name__c];
    }

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getBlocks(String siteId) {
        return [SELECT Id, animalshelters__Name__c FROM animalshelters__Locations__c 
                WHERE animalshelters__Parent_Block__c = :siteId AND RecordType.DeveloperName = 'Block'
                ORDER BY animalshelters__Name__c];
    }

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getUnits(String blockId) {
        return [SELECT Id, animalshelters__Name__c FROM animalshelters__Locations__c 
                WHERE animalshelters__Parent_Block__c = :blockId AND RecordType.DeveloperName = 'Unit'
                ORDER BY animalshelters__Name__c];
    }

    @AuraEnabled(cacheable=true)
    public static Map<String, List<animalshelters__Animal__c>> getAnimalsByUnit(List<String> unitIds) {
        Map<String, List<animalshelters__Animal__c>> unitAnimalMap = new Map<String, List<animalshelters__Animal__c>>();

        if (unitIds.isEmpty()) {
            return unitAnimalMap;
        }

        List<animalshelters__Movement__c> movements = [SELECT Id, animalshelters__Animal__c, animalshelters__Location__c, 
        animalshelters__Animal__r.animalshelters__Animal_Name__c, animalshelters__Animal__r.animalshelters__Animal_Status__c
                                        FROM animalshelters__Movement__c 
                                        WHERE animalshelters__Location__c IN :unitIds];

        for (animalshelters__Movement__c movement : movements) {
            if (!unitAnimalMap.containsKey(movement.animalshelters__Location__c)) {
                unitAnimalMap.put(movement.animalshelters__Location__c, new List<animalshelters__Animal__c>());
            }
            unitAnimalMap.get(movement.animalshelters__Location__c).add(movement.animalshelters__Animal__r);
        }

        return unitAnimalMap;
    }
}