public with sharing class AnimalShelterGetCustomSettings {

    @AuraEnabled(cacheable=true) 
    public static %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c getCustomSettings(){
        return %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c.getOrgDefaults();
    }

    @AuraEnabled
    public static void saveCustomSetting(%%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c customSetting) {
        update customSetting;
    }

    @AuraEnabled
    public static %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c createDefaultSettings() {
        %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c animal_settings = new %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c();
        animal_settings.%%%NAMESPACED_ORG%%%Breeds_Migration_Complete__c = true; 
        animal_settings.%%%NAMESPACED_ORG%%%Enable_Auto_Match__c = true;
        animal_settings.%%%NAMESPACED_ORG%%%Default_Animal_Name__c = true;
        animal_settings.%%%NAMESPACED_ORG%%%Disable_Behaviour_Update__c = false;
        animal_settings.%%%NAMESPACED_ORG%%%Default_Animal_Name_Prefix__c = '';
        animal_settings.%%%NAMESPACED_ORG%%%What3Words_API_Key__c = '';
        animal_settings.%%%NAMESPACED_ORG%%%microchip_api_Token__c = '';

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
