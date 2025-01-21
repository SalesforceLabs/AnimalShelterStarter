public with sharing class DataCheckController {

    @AuraEnabled(cacheable=true)
    public static Boolean hasBreedRecords() {
        if(Schema.SObjectType.animalshelters__Breed__c.isAccessible()){
            return [SELECT COUNT() FROM animalshelters__Breed__c] > 0;
            }
        return null;
    }
    
    @AuraEnabled(cacheable=true)
    public static Boolean hasLocationRecords() {
        if(Schema.SObjectType.animalshelters__Locations__c.isAccessible()){
            return [SELECT COUNT() FROM animalshelters__Locations__c] > 0;
            }
        return null;
        }

    @AuraEnabled(cacheable=true)
    public static Boolean isShelterNameValid() {
        if (Schema.SObjectType.animalshelters__Animal_Shelter_Settings__c.isAccessible()) {
            animalshelters__Animal_Shelter_Settings__c animal_settings = animalshelters__Animal_Shelter_Settings__c.getInstance();

            if (String.isBlank(animal_settings.Default_Shelter_Name__c)) {
                return false;
            }

            String accountName = animal_settings.Default_Shelter_Name__c;
            Account accountRecord = [
                SELECT ID
                FROM Account
                WHERE Name = :accountName
                LIMIT 1
            ];

            return (accountRecord!= null);
        }
    
    return null;
    }
}