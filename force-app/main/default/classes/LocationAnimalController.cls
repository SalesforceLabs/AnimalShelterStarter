/**
 * @File Name          : LocationAnimalController.cls
 * @Description        : Gets Animal records via Movement for current Location.  Used by locationAnimals LWC
 * @Author             : Chris Rolfe
 * @Last Modified By   : 
 * @Last Modified On   : 
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    22/08/2024   Chris Rolfe     Initial Version
**/

public with sharing class LocationAnimalController {
    
    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Movement__c> getAnimalsInLocation(Id locationId) {

        if(Schema.SObjectType.animalshelters__Locations__c.isAccessible() && Schema.SObjectType.animalshelters__Movement__c.isAccessible()){

            // Fetch Location record to check RecordType
            animalshelters__Locations__c location = [SELECT Id, RecordType.Name FROM animalshelters__Locations__c WHERE Id = :locationId LIMIT 1];
        
            // Check if the location is of type 'Unit'
            if (location.RecordType.Name == 'Unit') {
                // Fetch Movement records where Current = true and Location matches
                return [SELECT Id, animalshelters__Animal__r.animalshelters__Animal_Name__c 
                        FROM animalshelters__Movement__c 
                        WHERE animalshelters__Location__c = :locationId 
                        AND animalshelters__Current__c = TRUE];
            } else {
                // Return an empty list if it's not a Unit
                return new List<animalshelters__Movement__c>();
            }
        }
        return null;
    }
}
