public with sharing class AnimalShelterGetCustomSettings {

    @AuraEnabled(cacheable=true) 
    public static Animal_Shelter_Settings__c getCustomSettings(){
        return Animal_Shelter_Settings__c.getOrgDefaults();
    }

    @AuraEnabled
    public static void saveCustomSetting(Animal_Shelter_Settings__c customSetting) {
        update customSetting;
    }
}
