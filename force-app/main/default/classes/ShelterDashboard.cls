public with sharing class ShelterDashboard {

    @AuraEnabled(cacheable=true)
    public static List<DashboardWrapper> getLocationWithAnimals(){

        List<DashboardWrapper> locationsWithAnimals = new List<DashboardWrapper>();
        
        // Query Location Records with a RecordType of Unit
        List<animalshelters__Locations__c> locations = [ SELECT Id, animalshelters__Name__c, animalshelters__Parent_Block_Name__c, RecordType.Name, animalshelters__Animal_Record_Id__c 
                                                        FROM animalshelters__Locations__c
                                                        WHERE RecordType.DeveloperName = 'Unit'
                                                        WITH SECURITY_ENFORCED
                                                        ORDER BY animalshelters__Parent_Block_Name__c, animalshelters__Name__c ASC];

        // Prepare a set to hold Animal Ids for querying Animal Records
        Set<String> animalIds = new Set<String>();
        for(animalshelters__Locations__c loc : locations) {
            if(String.isNotBlank(loc.animalshelters__Animal_Record_Id__c)) {
                animalIds.add(loc.animalshelters__Animal_Record_Id__c);
            }
        }

        // Query Animal records based on collected Animal Ids
        Map<String, animalshelters__Animal__c> animalMap = new Map<String, animalshelters__Animal__c>();
        if(!animalIds.isEmpty()) {
            List<animalshelters__Animal__c> animals = [ SELECT Id, animalshelters__Animal_Name__c, animalshelters__Animal_Status__c
                                                        FROM animalshelters__Animal__c
                                                        WHERE Id IN :animalIds];
                for(animalshelters__Animal__c animal : animals) {
                    animalMap.put(animal.Id, animal);
                }
                                                            
        }

        //Combine Location and Animal Reocrds into DashboardWrapper objects
        for(animalshelters__Locations__c loc : locations) {
            DashboardWrapper wrapper = new DashboardWrapper();
            wrapper.locationId = loc.Id;
            wrapper.locationName = loc.animalshelters__Name__c;
            wrapper.locationParentBlock = loc.animalshelters__Parent_Block_Name__c;

            animalshelters__Animal__c relatedAnimal = animalMap.get(loc.animalshelters__Animal_Record_Id__c);
            if(relatedAnimal != null) {
                wrapper.animalName = relatedAnimal.animalshelters__Animal_Name__c;
                wrapper.animalStatus = relatedAnimal.animalshelters__Animal_Status__c;
            }
            locationsWithAnimals.add(wrapper);
        }
        return locationsWithAnimals;
    }

    // Wrapper class to hold combined Location and Animal data
    public class DashboardWrapper {
        @AuraEnabled public String locationId;
        @AuraEnabled public String locationName;
        @AuraEnabled public String locationParentBlock;
        @AuraEnabled public String animalName;
        @AuraEnabled public String animalStatus;
    }
}