/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 10-17-2023
 * @last modified by  : Stewart Anderson
**/
@IsTest
private class AnimalShelterGetCustomSettingsTest {

    @IsTest static void testGetCustomSetting() {
        // Create a new custom setting record
        %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c setting = new %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c();
        setting.%%%NAMESPACED_ORG%%%Breeds_Migration_Complete__c = True;
        setting.%%%NAMESPACED_ORG%%%Default_Animal_Name__c = False;
        setting.%%%NAMESPACED_ORG%%%Default_Animal_Name_Prefix__c = 'pre';
        setting.%%%NAMESPACED_ORG%%%microchip_api_Token__c = 'TestValue';
        insert setting;

        // Call the getCustomSetting method and verify that the returned value matches the expected value
        %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c returnedSetting = AnimalShelterGetCustomSettings.getCustomSettings();
        System.assertEquals(setting.%%%NAMESPACED_ORG%%%microchip_api_Token__c, returnedSetting.%%%NAMESPACED_ORG%%%microchip_api_Token__c);
    }

    @IsTest static void testSaveCustomSetting() {
        // Create a new custom setting record
        %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c setting = new %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c();
        setting.%%%NAMESPACED_ORG%%%Breeds_Migration_Complete__c = True;
        setting.%%%NAMESPACED_ORG%%%Default_Animal_Name__c = False;
        setting.%%%NAMESPACED_ORG%%%Default_Animal_Name_Prefix__c = 'pre';
        setting.%%%NAMESPACED_ORG%%%microchip_api_Token__c = 'TestValueNew';
        insert setting;

        // Call the saveCustomSetting method with a new value and verify that the custom setting is updated
        String newValue = 'New Test Value';
        setting.%%%NAMESPACED_ORG%%%microchip_api_Token__c = newValue;
        AnimalShelterGetCustomSettings.saveCustomSetting(setting);
        %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c updatedSetting = [SELECT %%%NAMESPACED_ORG%%%microchip_api_Token__c FROM %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c WHERE Id = :setting.Id];
        System.assertEquals(newValue, updatedSetting.%%%NAMESPACED_ORG%%%microchip_api_Token__c);
    }

    @IsTest static void testcreateDefaultSettings(){
        AnimalShelterGetCustomSettings.createDefaultSettings();
        %%%NAMESPACED_ORG%%%Animal_Shelter_Settings__c returnedSetting = AnimalShelterGetCustomSettings.getCustomSettings();
        System.assertEquals(true, returnedSetting.%%%NAMESPACED_ORG%%%Enable_Auto_Match__c);
    }



}
