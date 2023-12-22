/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 10-17-2023
 * @last modified by  : Stewart Anderson
**/
public with sharing class AnimalShelterGetCustomSettings {

    @AuraEnabled(cacheable=true)
    public static animalshelters__Animal_Shelter_Settings__c getCustomSettings(){
        return animalshelters__Animal_Shelter_Settings__c.getOrgDefaults();
    }

    @AuraEnabled
    public static void saveCustomSetting(animalshelters__Animal_Shelter_Settings__c customSetting) {
        update customSetting;
    }

    @AuraEnabled
    public static animalshelters__Animal_Shelter_Settings__c createDefaultSettings() {
        animalshelters__Animal_Shelter_Settings__c animal_settings = new animalshelters__Animal_Shelter_Settings__c();
        animal_settings.animalshelters__Breeds_Migration_Complete__c = true;
        animal_settings.animalshelters__Enable_Auto_Match__c = true;
        animal_settings.animalshelters__Default_Animal_Name__c = true;
        animal_settings.animalshelters__Disable_Behaviour_Update__c = false;
        animal_settings.animalshelters__Default_Animal_Name_Prefix__c = '';
        animal_settings.animalshelters__What3Words_API_Key__c = '';
        animal_settings.animalshelters__microchip_api_Token__c = '';

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