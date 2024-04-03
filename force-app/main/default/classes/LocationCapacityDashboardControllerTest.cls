@IsTest
public class LocationCapacityDashboardControllerTest {
    
    static testMethod void testGetLocationsWithNullSiteId() {
        // Test getLocations with a null siteId which should return an empty list
        Test.startTest();
        List<animalshelters__Locations__c> locations = LocationCapacityDashboardController.getLocations(null);
        Test.stopTest();

        System.assertEquals(0, locations.size(), 'The list should be empty when siteId is null.');
    }

    static testMethod void testGetLocationsWithSiteId() {
        // Setup test data
        RecordType siteRecordType = [SELECT Id FROM RecordType WHERE SObjectType = 'animalshelters__Locations__c' AND DeveloperName = 'Site' LIMIT 1];
        RecordType blockRecordType = [SELECT Id FROM RecordType WHERE SObjectType = 'animalshelters__Locations__c' AND DeveloperName = 'Block' LIMIT 1];

        animalshelters__Locations__c site = new animalshelters__Locations__c(
            RecordTypeId = siteRecordType.Id,
            animalshelters__Name__c = 'Test Site'
        );
        insert site;

        animalshelters__Locations__c block = new animalshelters__Locations__c(
            RecordTypeId = blockRecordType.Id,
            animalshelters__Name__c = 'Test Block',
            animalshelters__Parent_Block__c = site.Id
        );
        insert block;

        // Test getLocations with a valid siteId
        Test.startTest();
        List<animalshelters__Locations__c> locations = LocationCapacityDashboardController.getLocations(site.Id);
        Test.stopTest();

        System.assertEquals(1, locations.size(), 'The list should contain one record for the provided siteId.');
        System.assertEquals(block.Id, locations[0].Id, 'The block ID should match the inserted record.');
    }

    static testMethod void testGetSites() {
        // Setup test data
        RecordType siteRecordType = [SELECT Id FROM RecordType WHERE SObjectType = 'animalshelters__Locations__c' AND DeveloperName = 'Site' LIMIT 1];
        
        animalshelters__Locations__c site = new animalshelters__Locations__c(
            RecordTypeId = siteRecordType.Id,
            animalshelters__Name__c = 'Test Site'
        );
        insert site;

        // Test getSites
        Test.startTest();
        List<animalshelters__Locations__c> sites = LocationCapacityDashboardController.getSites();
        Test.stopTest();

        System.assertNotEquals(0, sites.size(), 'The list should not be empty.');
        Boolean siteFound = false;
        for(animalshelters__Locations__c s : sites) {
            if(s.Id == site.Id) {
                siteFound = true;
            }
        }
        System.assertEquals(true, siteFound, 'The inserted site should be found in the results.');
    }

}