@isTest
private class AnimalShelterDashboardControllerTest {

    static testMethod void testGetLocationsWithAnimals() {
        // Setup test data
        Test.startTest();
        
        // Get 'Site and Unit' RecordTypeIds for Locations
        RecordType siteRecordType = [SELECT Id FROM RecordType WHERE SObjectType='animalshelters__Locations__c' AND DeveloperName = 'Site' LIMIT 1];
        RecordType blockRecordType = [SELECT Id FROM RecordType WHERE SObjectType='animalshelters__Locations__c' AND DeveloperName = 'Block' LIMIT 1];
        RecordType unitRecordType = [SELECT Id FROM RecordType WHERE SObjectType='animalshelters__Locations__c' AND DeveloperName = 'Unit' LIMIT 1];
        
        // Create and insert test location records
        animalshelters__Locations__c siteLocation = new animalshelters__Locations__c(
            animalshelters__Name__c ='Test Site',
            RecordTypeId = siteRecordType.Id);
        insert siteLocation;
        
        animalshelters__Locations__c blockLocation = new animalshelters__Locations__c(
            animalshelters__Name__c ='Test Block',
            RecordTypeId = blockRecordType.Id,
        	animalshelters__Parent_Block__c = siteLocation.Id);
        insert blockLocation;
        
        animalshelters__Locations__c unitLocation = new animalshelters__Locations__c(
            animalshelters__Name__c ='Test Unit',
            RecordTypeId = unitRecordType.Id,
        	animalshelters__Parent_Block__c = blockLocation.Id);
        insert unitLocation;
        
        // Create and insert test animal records
        animalshelters__Animal__c testAnimal = new animalshelters__Animal__c(
            animalshelters__Animal_Name__c = 'Animal 1',
            animalshelters__Date_of_Arrival__c = Date.today());
        insert testAnimal;

        // Create and insert test movement records linking animals to locations
        animalshelters__Movement__c testMovement = new animalshelters__Movement__c(
            animalshelters__Animal__c = testAnimal.Id,
            animalshelters__Location__c = unitLocation.Id);
        insert testMovement;

        Test.stopTest();
        
        // Execute the method to test
        List<AnimalShelterDashboardController.LocationWrapper> result = AnimalShelterDashboardController.getLocationsWithAnimals('Test Site');
        
        // Verify the results
        System.assertNotEquals(null, result, 'The result should not be null.');
        System.assertEquals(1, result.size(), 'There should be one location returned.');
        System.assertEquals(1, result[0].animals.size(), 'There should be one animal in the location.');
    }

    static testMethod void testGetSites() {
        // Setup test data
        Test.startTest();
        
        // Insert a 'Site' record type for Locations
        RecordType siteRecordType = [SELECT Id FROM RecordType WHERE SObjectType='animalshelters__Locations__c' AND DeveloperName = 'Site' LIMIT 1];

        
        // Create and insert test location records
        List<animalshelters__Locations__c> testSites = new List<animalshelters__Locations__c>{
            new animalshelters__Locations__c(animalshelters__Name__c = 'Test Site 1', RecordTypeId = siteRecordType.Id),
            new animalshelters__Locations__c(animalshelters__Name__c = 'Test Site 2', RecordTypeId = siteRecordType.Id)
        };
        insert testSites;
        
        Test.stopTest();
        
        // Execute the method to test
        List<animalshelters__Locations__c> result = AnimalShelterDashboardController.getSites();
        
        // Verify the results
        System.assertNotEquals(null, result, 'The result should not be null.');
        System.assertEquals(2, result.size(), 'There should be two sites returned.');
    }
}