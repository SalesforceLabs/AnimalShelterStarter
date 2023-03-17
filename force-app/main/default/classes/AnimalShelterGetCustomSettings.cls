public with sharing class AnimalShelterGetCustomSettings {

    @AuraEnabled(cacheable=true) 
    public static Animal_Shelter_Settings__c getCustomSettings(){
        return Animal_Shelter_Settings__c.getOrgDefaults();
    }

    @AuraEnabled
    public static void saveCustomSetting(Animal_Shelter_Settings__c customSetting) {
        update customSetting;
    }

    @AuraEnabled
    public static Animal_Shelter_Settings__c createDefaultSettings() {
        Animal_Shelter_Settings__c animal_settings = new Animal_Shelter_Settings__c();
        animal_settings.Breeds_Migration_Complete__c = true; 
        animal_settings.Enable_Auto_Match__c = true;
        animal_settings.Default_Animal_Name__c = true;
        animal_settings.Disable_Behaviour_Update__c = false;
        animal_settings.Default_Animal_Name_Prefix__c = '';
        animal_settings.What3Words_API_Key__c = '';
        animal_settings.microchip_api_Token__c = '';

        Database.SaveResult sr = Database.insert(animal_settings, false);
        if (sr.isSuccess()) {
            // Insert successful
            return animal_settings;
        } else {
            // Insert failed
            String errMsg = sr.getErrors()[0].getMessage();
            System.debug('Error message: ' + errMsg);
            throw new AuraHandledException('Error creating default settings: ' + errMsg);
        }
    }
}
