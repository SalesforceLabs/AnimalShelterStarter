public with sharing class SetupCheckController {

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
    public static String shelterAccountCheck() {
        if (Schema.SObjectType.animalshelters__Animal_Shelter_Settings__c.isAccessible()) {
            animalshelters__Animal_Shelter_Settings__c animal_settings = animalshelters__Animal_Shelter_Settings__c.getOrgDefaults();

            // If Default Shelter Name is Empty, return Advisory message
            if (String.isEmpty(animal_settings.Default_Shelter_Name__c)) {
                return 'Advisory: Default Shelter Name not set';
            }

            // Get Account Name
            String accountName = animal_settings.Default_Shelter_Name__c;

            // Query to see if account exists
            Account existingAccount = [
                SELECT ID
                FROM Account
                WHERE Name = :accountName
                LIMIT 1
            ];

            if (existingAccount != null) {
                return 'Pass: Matching Shelter (Account) record to Default Shelter Name found'; // Account Exists
            } else {
                return 'Fail: No matching Shelter (Account) record found to Default Shelter Name'; // Account Does Not Exist
            }

        }
    
    return null;
    }
}