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
    public static List<animalshelters__Locations__c> getUnitsAndSubBlockUnits (String blockId) {
        Set<Id> unitParentIds = new Set<Id>{blockId};  //Include the selected block as well


        for (animalshelters__Locations__c subBlock : [SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Parent_Block__c = :blockId AND RecordType.DeveloperName = 'SubBlock']){
            unitParentIds.add(subBlock.Id);
        }

        //Get all Units under the selected Block and SubBlocks
        return [SELECT Id, animalshelters__Name__c FROM animalshelters__Locations__c 
                    WHERE animalshelters__Parent_Block__c IN :unitParentIds AND RecordType.DeveloperName = 'Unit'
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
                                        WHERE animalshelters__Location__c IN :unitIds
                                        ORDER BY animalshelters__Animal__r.animalshelters__Animal_Name__c];  // Sort by animal name

        for (animalshelters__Movement__c movement : movements) {
            if (!unitAnimalMap.containsKey(movement.animalshelters__Location__c)) {
                unitAnimalMap.put(movement.animalshelters__Location__c, new List<animalshelters__Animal__c>());
            }
            unitAnimalMap.get(movement.animalshelters__Location__c).add(movement.animalshelters__Animal__r);
        }

        return unitAnimalMap;
    }
}