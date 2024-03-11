public with sharing class AnimalShelterDashboardController {

    // Wrappers for Location and Animal

    public class LocationWrapper {
        @AuraEnabled
        public animalshelters__Locations__c location;
        @AuraEnabled
        public List<AnimalWrapper> animals;
        public LocationWrapper(animalshelters__Locations__c loc) {
            this.location = loc;
            this.animals = new List<AnimalWrapper>();
        }   
    }

    public class AnimalWrapper {
        @AuraEnabled
        public animalshelters__Animal__c animal;
        @AuraEnabled
        public List<animalshelters__Animal_Action__c> upcomingActions;
        public List<animalshelters__Condition__c> conditions;
        public AnimalWrapper(animalshelters__Animal__c ani) {
            this.animal = ani;
            this.upcomingActions = new List<animalshelters__Animal_Action__c>();
            this.conditions = new List<animalshelters__Condition__c>();
        }   
    }

    @AuraEnabled(cacheable=true)
    public static List<LocationWrapper> getLocationsWithAnimals(String site) {

        List<LocationWrapper> locationWrappers = new List<LocationWrapper>();
        Map<Id, LocationWrapper> locationMap = new Map<Id, LocationWrapper>();



        // Query Location Records with the RecordType = Unit
        List<animalshelters__Locations__c> locations = [ SELECT Id, animalshelters__Name__c, animalshelters__Parent_Block_Name__c, RecordType.Name, (SELECT Id, animalshelters__Animal__c FROM animalshelters__Movements__r) 
                                                        FROM animalshelters__Locations__c
                                                        WHERE RecordType.DeveloperName = 'Unit' AND animalshelters__Sitename__c = :site
                                                        WITH SECURITY_ENFORCED
                                                        ORDER BY animalshelters__Parent_Block_Name__c, animalshelters__Name__c ASC];

        // Prepare a set to hold Animal Ids for querying Animal Records
        List<Id> animalIds = new List<Id>();
        for (animalshelters__Locations__c loc : locations) {
            LocationWrapper locWrapper = new LocationWrapper(loc);
            locationMap.put(loc.Id, locWrapper);
            for (animalshelters__Movement__c mov : loc.animalshelters__Movements__r) {
                if (!animalIds.contains(mov.animalshelters__Animal__c)){
                    animalIds.add(mov.animalshelters__Animal__c);
                }
            }
        }

        Map<Id, AnimalWrapper> animalMap = new Map<Id, AnimalWrapper>();
        List<animalshelters__Animal__c> animals = [SELECT Id, animalshelters__Animal_Name__c, animalshelters__Animal_Status__c, animalshelters__Total_Length_of_Stay_in_Shelter_Days__c, animalshelters__Alerts_Present__c, animalshelters__Age_Category__c, animalshelters__Current_Weight__c, animalshelters__Gender__c, animalshelters__Colour__c, animalshelters__Species__c, animalshelters__TypeFromBreeds__c, 
                (SELECT Id, RecordType.Name, animalshelters__Action_Type__c, animalshelters__Treatment_Type__c, animalshelters__Action_Completed__c, animalshelters__Date_Time_of_Action__c, animalshelters__Description__c FROM animalshelters__Animal_Actions__r WHERE animalshelters__Date_Time_of_Action__c <= NEXT_N_DAYS:7 AND animalshelters__Date_Time_of_Action__c >= TODAY AND animalshelters__Action_Completed__c = false ORDER BY animalshelters__Date_Time_of_Action__c ASC),
                (SELECT Id, animalshelters__Condition_Description__c, animalshelters__Start_Date__c FROM animalshelters__Conditions__r WHERE animalshelters__Start_Date__c <= NEXT_N_DAYS:7 AND animalshelters__Start_Date__c >= TODAY ORDER BY animalshelters__Start_Date__c ASC )
                FROM animalshelters__Animal__c
                WHERE Id IN :animalIds
                WITH SECURITY_ENFORCED];

                for (animalshelters__Animal__c ani : animals){
                    AnimalWrapper aniWrapper = new AnimalWrapper(ani);
                    aniWrapper.upcomingActions = ani.animalshelters__Animal_Actions__r;
                    aniWrapper.conditions = ani.animalshelters__Conditions__r;
                    animalMap.put(ani.Id, aniWrapper);
                }
            
                for (animalshelters__Locations__c loc : locations){
                    LocationWrapper locWrapper = locationMap.get(loc.Id);
                    for (animalshelters__Movement__c mov : loc.animalshelters__Movements__r){
                        if (animalMap.containsKey(mov.animalshelters__Animal__c)) {

                            locWrapper.animals.add(animalMap.get(mov.animalshelters__Animal__c));
                        }
                    } 
            }
            locationWrappers.addAll(locationMap.values());
            return locationWrappers;
    }

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getSites() {

        Id recordTypeId = [SELECT Id
                            FROM RecordType
                            WHERE SObjectType = 'animalshelters__Locations__c' AND DeveloperName = 'Site'].Id;

        return [SELECT Id, animalshelters__Name__c, animalshelters__Sitename__c FROM animalshelters__Locations__c WHERE RecordTypeId = :recordTypeId WITH SECURITY_ENFORCED];
    }
}