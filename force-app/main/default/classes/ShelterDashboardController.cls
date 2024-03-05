/**
 * @File Name          : ShelterDashboardController.apxc
 * @Description        : Get Location Records, and Associated Animal Records to populate the Shelter Dashboard
 *                     : This is the controller for the Shelter Dashboard Lightning Component
 *
 * @Author             : Chris Rolfe (Salesforce)
 * @Last Modified By   : Chris Rolfe
 * @Last Modified On   : 02-26-2024
 * @Modification Log   : 
 * Ver       Date            Author      Modification
 * 1.0    02-26-2024   Chris Rolfe       Initial Version
**/

public with sharing class ShelterDashboardController {

    @AuraEnabled(cacheable=true)
    public static List<DashboardWrapper> getLocationsWithAnimals(String site){

        List<DashboardWrapper> locationsWithAnimals = new List<DashboardWrapper>();
        
        // Query Location Records with the RecordType = Unit
        List<animalshelters__Locations__c> locations = [ SELECT Id, animalshelters__Name__c, animalshelters__Parent_Block_Name__c, RecordType.Name, animalshelters__Animal_Record_Id__c 
                                                        FROM animalshelters__Locations__c
                                                        WHERE RecordType.DeveloperName = 'Unit' AND animalshelters__Sitename__c = :site
                                                        WITH SECURITY_ENFORCED
                                                        ORDER BY animalshelters__Parent_Block_Name__c, animalshelters__Name__c ASC];

        // Prepare a set to hold Animal Ids for querying Animal Records
        Set<String> animalIds = new Set<String>();
        for(animalshelters__Locations__c loc : locations) {
            if(String.isNotBlank(loc.animalshelters__Animal_Record_Id__c)) {
                animalIds.add(loc.animalshelters__Animal_Record_Id__c);
            }
        }

        // Query Animal records based on collected AnimalIds
        Map<String, animalshelters__Animal__c> animalMap = new Map<String, animalshelters__Animal__c>();
        if(!animalIds.isEmpty()) {
            List<animalshelters__Animal__c> animals = [ SELECT Id, animalshelters__Animal_Name__c, animalshelters__Animal_Status__c, animalshelters__Total_Length_of_Stay_in_Shelter_Days__c, animalshelters__Alerts_Present__c, animalshelters__Age_Category__c, animalshelters__Current_Weight__c, animalshelters__Gender__c, animalshelters__Colour__c, animalshelters__Species__c, animalshelters__TypeFromBreeds__c, (SELECT Id, animalshelters__Action_Type__c, animalshelters__Action_Completed__c, animalshelters__Date_Time_of_Action__c, animalshelters__Description__c, RecordType.Name, animalshelters__Animal__c FROM animalshelters__Animal_Actions__r WHERE animalshelters__Date_Time_of_Action__c <= NEXT_N_DAYS:7 AND animalshelters__Date_Time_of_Action__c >= TODAY AND animalshelters__Action_Completed__c = false)
                                                        FROM animalshelters__Animal__c
                                                        WHERE Id IN :animalIds
                                                        WITH SECURITY_ENFORCED];
                for(animalshelters__Animal__c animal : animals) {
                    animalMap.put(animal.Id, animal);
                }                                               
        }

        //Combine Location and Animal Records into DashboardWrapper objects
        for(animalshelters__Locations__c loc : locations) {
            DashboardWrapper wrapper = new DashboardWrapper();
            wrapper.locationId = loc.Id;
            wrapper.locationName = loc.animalshelters__Name__c;
            wrapper.locationParentBlock = loc.animalshelters__Parent_Block_Name__c;

            animalshelters__Animal__c relatedAnimal = animalMap.get(loc.animalshelters__Animal_Record_Id__c);
            if(relatedAnimal != null) {
                wrapper.animalId = relatedAnimal.Id;
                wrapper.animalName = relatedAnimal.animalshelters__Animal_Name__c;
                wrapper.animalStatus = relatedAnimal.animalshelters__Animal_Status__c;
                wrapper.animalStayLength = String.valueOf(relatedAnimal.animalshelters__Total_Length_of_Stay_in_Shelter_Days__c);
                wrapper.animalAlertsFlag = relatedAnimal.animalshelters__Alerts_Present__c;
                wrapper.animalCurrentWeight = String.valueOf(relatedAnimal.animalshelters__Current_Weight__c);
                wrapper.animalGender = relatedAnimal.animalshelters__Gender__c;
                wrapper.animalColour = relatedAnimal.animalshelters__Colour__c;
                wrapper.animalSpecies = relatedAnimal.animalshelters__Species__c;
                wrapper.animalType = relatedAnimal.animalshelters__TypeFromBreeds__c;
                if(relatedAnimal.animalshelters__Animal_Actions__r.size() == 0) {
                    wrapper.animalActionId = null;
                    wrapper.animalActionType = 'None';
                    wrapper.animalActionDatetime = null;
                    wrapper.animalActionDescription = null;
                } else {
                    wrapper.animalActionId = relatedAnimal.animalshelters__Animal_Actions__r.get(0).Id;
                    wrapper.animalActionType = relatedAnimal.animalshelters__Animal_Actions__r.get(0).animalshelters__Action_Type__c;
                    wrapper.animalActionDateTime = relatedAnimal.animalshelters__Animal_Actions__r.get(0).animalshelters__Date_Time_of_Action__c.format('dd-MM-yyyy HH:mm', UserInfo.getTimeZone().getID());
                    wrapper.animalActionDescription = relatedAnimal.animalshelters__Animal_Actions__r.get(0).animalshelters__Description__c;
                }
            }
            locationsWithAnimals.add(wrapper);
        }
        return locationsWithAnimals;
    }

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getSites() {

        Id recordTypeId = [SELECT Id
                            FROM RecordType
                            WHERE SObjectType = 'animalshelters__Locations__c' AND DeveloperName = 'Site'].Id;

        return [SELECT Id, animalshelters__Name__c, animalshelters__Sitename__c FROM animalshelters__Locations__c WHERE RecordTypeId = :recordTypeId WITH SECURITY_ENFORCED];
    }

    // Wrapper class to hold combined Location and Animal data
    @TestVisible
    public class DashboardWrapper {
        @AuraEnabled public String locationId;
        @AuraEnabled public String locationName;
        @AuraEnabled public String locationParentBlock;
        @AuraEnabled public String animalId;
        @AuraEnabled public String animalName;
        @AuraEnabled public String animalStatus;
        @AuraEnabled public String animalActionType;
        @AuraEnabled public String animalActionDateTime;
        @AuraEnabled public String animalActionDescription;
        @AuraEnabled public String animalStayLength;
        @AuraEnabled public Boolean animalAlertsFlag;
        @AuraEnabled public String animalCurrentWeight;
        @AuraEnabled public String animalGender;
        @AuraEnabled public String animalColour;
        @AuraEnabled public String animalSpecies;
        @AuraEnabled public String animalType;
        @AuraEnabled public String animalActionId;
        }

    }

