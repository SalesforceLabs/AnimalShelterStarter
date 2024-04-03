/**
 * @File Name          : AnimalShelterDashboardController.apxc
 * @Description        : Gets Locations, Animals, Actions, Alerts and Condition data to display in LWC
 *                     : Used by LWC animalShelterDashboard
 * @Author             : Chris Rolfe (Salesforce)
 * @Group              :
 * @Last Modified By   : 
 * @Last Modified On   : 
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    11/03/2024   Chris Rolfe (Salesforce)     Initial Version
**/
public with sharing class AnimalShelterDashboardController {

    // Wrappers for Location and Animal
    public class LocationWrapper {
        @AuraEnabled
        public animalshelters__Locations__c location;
        @AuraEnabled
        public List<AnimalWrapper> animals;
    }

    public class AnimalWrapper {
        @AuraEnabled
        public animalshelters__Animal__c animal;
        @AuraEnabled
        public List<animalshelters__Animal_Action__c> upcomingActions;
        @AuraEnabled
        public Boolean hasConditions;
        @AuraEnabled
        public Boolean hasAlerts;
        @AuraEnabled
        public Boolean hasTreatmentAction;
        @AuraEnabled
        public Boolean hasNutritionAction;
        @AuraEnabled
        public Boolean hasExerciseAction;
        @AuraEnabled
        public Boolean hasVaccination;

    }

    @AuraEnabled(cacheable=true)
    public static List<LocationWrapper> getLocationsWithAnimals(String site) {

        List<LocationWrapper> locationWrappers = new List<LocationWrapper>();

        // Query Location Records with the RecordType = Unit
        List<animalshelters__Locations__c> locations = [ SELECT Id, animalshelters__Name__c, animalshelters__Parent_Block_Name__c, RecordType.Name, (SELECT Id, animalshelters__Animal__c FROM animalshelters__Movements__r) 
                                                        FROM animalshelters__Locations__c
                                                        WHERE RecordType.DeveloperName = 'Unit' AND animalshelters__Sitename__c = :site
                                                        WITH SECURITY_ENFORCED
                                                        ORDER BY animalshelters__Parent_Block_Name__c, animalshelters__Name__c ASC];

        // Prepare a set to hold Animal Ids for querying Animal Records
        Set<Id> animalIds = new Set<Id>();
        for (animalshelters__Locations__c loc : locations) {
            for (animalshelters__Movement__c mov : loc.animalshelters__Movements__r) {
                if (!animalIds.contains(mov.animalshelters__Animal__c)){
                    animalIds.add(mov.animalshelters__Animal__c);
                }
            }
        }

        // Query Animal records and related Animal_Action records
        Map<Id, animalshelters__Animal__c> animalsMap = new Map<Id, animalshelters__Animal__c>([SELECT Id, animalshelters__Animal_Name__c, animalshelters__Animal_Status__c, animalshelters__Total_Length_of_Stay_in_Shelter_Days__c, animalshelters__Alerts_Present__c, animalshelters__Age_Category__c, animalshelters__Current_Weight__c, animalshelters__Gender__c, animalshelters__Colour__c, animalshelters__Species__c, animalshelters__TypeFromBreeds__c, 
        (SELECT Id, RecordType.Name, animalshelters__Action_Type__c, animalshelters__Treatment_Type__c, animalshelters__Action_Completed__c, animalshelters__Date_Time_of_Action__c, animalshelters__Description__c FROM animalshelters__Animal_Actions__r WHERE animalshelters__Date_Time_of_Action__c <= NEXT_N_DAYS:7 AND animalshelters__Date_Time_of_Action__c >= TODAY AND animalshelters__Action_Completed__c = false ORDER BY animalshelters__Date_Time_of_Action__c ASC)
        FROM animalshelters__Animal__c
        WHERE Id IN :animalIds
        WITH SECURITY_ENFORCED]);

        // Query for Condition records related to Animal records
        Map<Id, List<animalshelters__Condition__c>> animalConditionMap = new Map<Id, List<animalshelters__Condition__c>>();
        for (animalshelters__Condition__c cond: [SELECT Id, animalshelters__Animal__c FROM animalshelters__Condition__c WHERE animalshelters__Animal__c IN :animalIds AND animalshelters__End_Date_Time__c = null WITH SECURITY_ENFORCED]) {
            if (!animalConditionMap.containsKey(cond.animalshelters__Animal__c)){
                animalConditionMap.put(cond.animalshelters__Animal__c, new List<animalshelters__Condition__c>());
            }
            animalConditionMap.get(cond.animalshelters__Animal__c).add(cond);
        }

        //Query for Alert records related to Animal records
        Map<Id, List<animalshelters__Animal_Alert__c>> animalAlertMap = new Map<Id, List<animalshelters__Animal_Alert__c>>();
        for (animalshelters__Animal_Alert__c alert: [SELECT Id, animalshelters__Animal__c FROM animalshelters__Animal_Alert__c WHERE animalshelters__Animal__c IN :animalIds AND animalshelters__End_Date_Time__c = null WITH SECURITY_ENFORCED]) {
            if (!animalAlertMap.containsKey(alert.animalshelters__Animal__c)){
                animalAlertMap.put(alert.animalshelters__Animal__c, new List<animalshelters__Animal_Alert__c>());
            }
            animalAlertMap.get(alert.animalshelters__Animal__c).add(alert);
        }

        // Construct response Wrapper
        for (animalshelters__Locations__c loc : locations){
            LocationWrapper locWrapper = new LocationWrapper();
            locWrapper.location = loc;
            locWrapper.animals = new List<AnimalWrapper>();
            for (animalshelters__Movement__c mov : loc.animalshelters__Movements__r){
                if (animalsMap.containsKey(mov.animalshelters__Animal__c)) {
                    AnimalWrapper aniWrapper = new AnimalWrapper();
                    aniWrapper.animal = animalsMap.get(mov.animalshelters__Animal__c);
                    aniWrapper.upcomingActions = aniWrapper.animal.animalshelters__Animal_Actions__r;
                    // Set hasConditons and hasAlerts flags based on the presence of related Condition/Alert records
                    for(animalshelters__Animal_Action__c action : aniWrapper.upcomingActions){
                        if(action.RecordType.Name == 'Nutrition') {
                            aniWrapper.hasNutritionAction = true;
                        } else if(action.RecordType.Name == 'Exercise'){
                            aniWrapper.hasExerciseAction = true;
                        } else if(action.RecordType.Name == 'Treatment' && action.animalshelters__Treatment_Type__c == 'Vaccination'){
                            aniWrapper.hasVaccination = true;
                        } else if(action.RecordType.Name == 'Treatment' && action.animalshelters__Treatment_Type__c != 'Vaccination'){
                            aniWrapper.hasTreatmentAction = true;
                        }
                    }
                    aniWrapper.hasConditions = animalConditionMap.containsKey(mov.animalshelters__Animal__c) && !animalConditionMap.get(mov.animalshelters__Animal__c).isEmpty();
                    aniWrapper.hasAlerts = animalAlertMap.containsKey(mov.animalshelters__Animal__c) && !animalAlertMap.get(mov.animalshelters__Animal__c).isEmpty();
                    locWrapper.animals.add(aniWrapper);
                }
            } 
            locationWrappers.add(locWrapper);
        }
        return locationWrappers;
    }
    // Get RecordType ID for Site, used to populate Site dropdown on Animal Dashboard
    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getSites() {

        Id recordTypeId = [SELECT Id
                            FROM RecordType
                            WHERE SObjectType = 'animalshelters__Locations__c' AND DeveloperName = 'Site'].Id;

        return [SELECT Id, animalshelters__Name__c, animalshelters__Sitename__c FROM animalshelters__Locations__c WHERE RecordTypeId = :recordTypeId WITH SECURITY_ENFORCED];
    }
}