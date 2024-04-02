/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 01-15-2024
 * @last modified by  : Stewart Anderson
**/
public with sharing class AnimalShelterGetCustomSettings {

    @AuraEnabled(Cacheable=true)
    public static animalshelters__Animal_Shelter_Settings__c getCustomSettings(){
        if (Schema.SObjectType.animalshelters__Animal_Shelter_Settings__c.isAccessible()) {
            return animalshelters__Animal_Shelter_Settings__c.getOrgDefaults();
        } else {
            throw new AuraHandledException('Access Issue: There was an attempt to access Animal Shelter Starter Settings by a user without access.');
        }

    }

    @AuraEnabled
    public static void saveCustomSetting(animalshelters__Animal_Shelter_Settings__c customSetting) {
        if (Schema.SObjectType.animalshelters__Animal_Shelter_Settings__c.isUpdateable()) {
            update customSetting;
        } else {
            throw new AuraHandledException('Access Issue: There was an attempt to update Animal Shelter Starter Settings by a user without access.');
        }

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

        Database.SaveResult sr = Database.insert(animal_settings, false, AccessLevel.USER_MODE);
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
