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
        animalshelters__Animal_Shelter_Settings__c setting = new animalshelters__Animal_Shelter_Settings__c();
        setting.animalshelters__Breeds_Migration_Complete__c = true;
        setting.animalshelters__Default_Animal_Name__c = false;
        setting.animalshelters__Default_Animal_Name_Prefix__c = 'pre';
        setting.animalshelters__microchip_api_Token__c = 'TestValue';
        insert setting;

        // Call the getCustomSetting method and verify that the returned value matches the expected value
        animalshelters__Animal_Shelter_Settings__c returnedSetting = AnimalShelterGetCustomSettings.getCustomSettings();
        System.assertEquals(setting.animalshelters__microchip_api_Token__c, returnedSetting.animalshelters__microchip_api_Token__c);
    }

    @IsTest static void testSaveCustomSetting() {
        // Create a new custom setting record
        animalshelters__Animal_Shelter_Settings__c setting = new animalshelters__Animal_Shelter_Settings__c();
        setting.animalshelters__Breeds_Migration_Complete__c = true;
        setting.animalshelters__Default_Animal_Name__c = false;
        setting.animalshelters__Default_Animal_Name_Prefix__c = 'pre';
        setting.animalshelters__microchip_api_Token__c = 'TestValueNew';
        insert setting;

        // Call the saveCustomSetting method with a new value and verify that the custom setting is updated
        String newValue = 'New Test Value';
        setting.animalshelters__microchip_api_Token__c = newValue;
        AnimalShelterGetCustomSettings.saveCustomSetting(setting);
        animalshelters__Animal_Shelter_Settings__c updatedSetting = [SELECT animalshelters__microchip_api_Token__c FROM animalshelters__Animal_Shelter_Settings__c WHERE Id = :setting.Id];
        System.assertEquals(newValue, updatedSetting.animalshelters__microchip_api_Token__c);
    }

    @IsTest static void testcreateDefaultSettings(){
        AnimalShelterGetCustomSettings.createDefaultSettings();
        animalshelters__Animal_Shelter_Settings__c returnedSetting = AnimalShelterGetCustomSettings.getCustomSettings();
        System.assertEquals(true, returnedSetting.animalshelters__Enable_Auto_Match__c);
    }



}