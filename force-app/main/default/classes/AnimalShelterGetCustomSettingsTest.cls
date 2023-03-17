@IsTest
private class AnimalShelterGetCustomSettingsTest {
    
    @IsTest static void testGetCustomSetting() {
        // Create a new custom setting record
        Animal_Shelter_Settings__c setting = new Animal_Shelter_Settings__c();
        setting.Breeds_Migration_Complete__c = True;
        setting.Default_Animal_Name__c = False;
        setting.Default_Animal_Name_Prefix__c = 'pre';
        setting.microchip_api_Token__c = 'TestValue';
        insert setting;

        // Call the getCustomSetting method and verify that the returned value matches the expected value
        Animal_Shelter_Settings__c returnedSetting = AnimalShelterGetCustomSettings.getCustomSettings();
        System.assertEquals(setting.microchip_api_Token__c, returnedSetting.microchip_api_Token__c);
    }

    @IsTest static void testSaveCustomSetting() {
        // Create a new custom setting record
        Animal_Shelter_Settings__c setting = new Animal_Shelter_Settings__c();
        setting.Breeds_Migration_Complete__c = True;
        setting.Default_Animal_Name__c = False;
        setting.Default_Animal_Name_Prefix__c = 'pre';
        setting.microchip_api_Token__c = 'TestValueNew';
        insert setting;

        // Call the saveCustomSetting method with a new value and verify that the custom setting is updated
        String newValue = 'New Test Value';
        setting.microchip_api_Token__c = newValue;
        AnimalShelterGetCustomSettings.saveCustomSetting(setting);
        Animal_Shelter_Settings__c updatedSetting = [SELECT microchip_api_Token__c FROM Animal_Shelter_Settings__c WHERE Id = :setting.Id];
        System.assertEquals(newValue, updatedSetting.microchip_api_Token__c);
    }

    @IsTest static void testcreateDefaultSettings(){
        AnimalShelterGetCustomSettings.createDefaultSettings();
        Animal_Shelter_Settings__c returnedSetting = AnimalShelterGetCustomSettings.getCustomSettings();
        System.assertEquals(true, returnedSetting.Enable_Auto_Match__c);
    }



}