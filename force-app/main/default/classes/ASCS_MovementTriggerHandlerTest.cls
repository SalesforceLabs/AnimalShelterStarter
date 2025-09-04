@isTest
private class ASCS_MovementTriggerHandlerTest {

    @TestSetup
    static void setupTestData() {
        // Create custom setting to ensure trigger is enabled
        animalshelters__Animal_Shelter_Settings__c settings = animalshelters__Animal_Shelter_Settings__c.getOrgDefaults();
        if (settings == null) {
            settings = new animalshelters__Animal_Shelter_Settings__c();
        }
        settings.animalshelters__Movement_Trigger_Enabled__c = true;
        upsert settings;

        // Fetch all necessary record type Ids in one go
        Map<String, Schema.RecordTypeInfo> recordTypeMap = Schema.SObjectType.animalshelters__Locations__c.getRecordTypeInfosByDeveloperName();
        String unitRecordTypeId = recordTypeMap.get('Unit').getRecordTypeId();
        String blockRecordTypeId = recordTypeMap.get('Block').getRecordTypeId();
        String siteRecordTypeId = recordTypeMap.get('Site').getRecordTypeId();

        // Create the Site and Block locations
        animalshelters__Locations__c locationSite = new animalshelters__Locations__c(
            animalshelters__Name__c = 'Test Location Site',
            recordTypeId = siteRecordTypeId
        );

        insert locationSite;

        animalshelters__Locations__c locationBlock = new animalshelters__Locations__c(
            animalshelters__Name__c = 'Test Location Block',
            recordTypeId = blockRecordTypeId,
            animalshelters__Parent_Block__c = locationSite.Id
        );

        insert locationBlock ;

        // Create two Unit locations
        List<animalshelters__Locations__c> locationList = new List<animalshelters__Locations__c>();
        animalshelters__Locations__c location1 = new animalshelters__Locations__c(
            animalshelters__Name__c = 'Test Location',
            recordTypeId = unitRecordTypeId,
            animalshelters__Capacity__c = 5,
            animalshelters__Parent_Block__c = locationBlock.Id
        );

        animalshelters__Locations__c location2 = new animalshelters__Locations__c(
            animalshelters__Name__c = 'Test Location 2',
            recordTypeId = unitRecordTypeId,
            animalshelters__Capacity__c = 5,
            animalshelters__Parent_Block__c = locationBlock.Id
        );

        locationList.add(location1);
        locationList.add(location2);

        // Insert unit locations
        insert locationList;

        // Create an Animal record
        animalshelters__Animal__c animal = new animalshelters__Animal__c(
            animalshelters__Microchip__c = '123456',
            animalshelters__Animal_Name__c = 'Test Dog',
            //ASCS_Status_Reason__c = 'None',
            animalshelters__Date_of_Arrival__c = DateTime.now()
        );
        insert animal;
    }

    @IsTest
    public static void testMovementTrigger() {
        // Retrieve test data created in @TestSetup
        animalshelters__Locations__c location1 = [SELECT Id, animalshelters__Allocation__c FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Test Location' LIMIT 1];
        animalshelters__Locations__c location2 = [SELECT Id, animalshelters__Allocation__c FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Test Location 2' LIMIT 1];
        animalshelters__Animal__c animal = [SELECT Id FROM animalshelters__Animal__c WHERE animalshelters__Animal_Name__c = 'Test Dog' LIMIT 1];

        // Start test block for DML operation simulation
        Test.startTest();

        // Create the first Movement
        animalshelters__Movement__c movement1 = new animalshelters__Movement__c(
            animalshelters__Location__c = location1.Id,
            animalshelters__Current__c = true,
            animalshelters__Animal__c = animal.Id
        );
        insert movement1;

        // Verify the first location's allocation after first movement
        animalshelters__Locations__c updatedLocation1 = [SELECT animalshelters__Allocation__c FROM animalshelters__Locations__c WHERE Id = :location1.Id];
        System.debug('Location 1 Allocation after first movement: ' + updatedLocation1.animalshelters__Allocation__c);
        System.assertEquals(1, updatedLocation1.animalshelters__Allocation__c, 'Location 1 should have 1 allocation after first movement');

        // Create the second movement, mark the first as inactive
        animalshelters__Movement__c movement2 = new animalshelters__Movement__c(
            animalshelters__Location__c = location2.Id,
            animalshelters__Current__c = true,
            animalshelters__Animal__c = animal.Id
        );
        movement1.animalshelters__Current__c = false;

        // Insert new movement and update the first
        insert movement2;
        update movement1;

        // End test block
        Test.stopTest();

        // Query both locations for allocation check
        List<animalshelters__Locations__c> updatedLocations = [SELECT Id, animalshelters__Allocation__c FROM animalshelters__Locations__c WHERE Id IN :new Set<Id>{location1.Id, location2.Id}];

        // Verify allocations after the movements
        for (animalshelters__Locations__c loc : updatedLocations) {
            if (loc.Id == location1.Id) {
                System.assertEquals(0, loc.animalshelters__Allocation__c, 'Location 1 should have 0 allocation');
            } else if (loc.Id == location2.Id) {
                System.assertEquals(1, loc.animalshelters__Allocation__c, 'Location 2 should have 1 allocation');
            }
        }
    }

    @IsTest
    public static void testHandlerMethodsDirectly() {
        // Retrieve test data created in @TestSetup
        animalshelters__Locations__c location1 = [SELECT Id, animalshelters__Allocation__c FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Test Location' LIMIT 1];
        animalshelters__Animal__c animal = [SELECT Id FROM animalshelters__Animal__c WHERE animalshelters__Animal_Name__c = 'Test Dog' LIMIT 1];

        // Create a movement without triggering the trigger
        animalshelters__Movement__c movement1 = new animalshelters__Movement__c(
            animalshelters__Location__c = location1.Id,
            animalshelters__Current__c = true,
            animalshelters__Animal__c = animal.Id
        );

        Test.startTest();
        
        // Insert movement without trigger
        Database.insert(movement1, false);
        
        // Manually call the handler method to test it directly
        Map<Id, animalshelters__Movement__c> newMap = new Map<Id, animalshelters__Movement__c>();
        newMap.put(movement1.Id, movement1);
        
        ASCS_MovementTriggerHandler.handleInsert(newMap);
        
        Test.stopTest();

        // Verify the location's allocation was updated
        animalshelters__Locations__c updatedLocation = [SELECT animalshelters__Allocation__c FROM animalshelters__Locations__c WHERE Id = :location1.Id];
        System.debug('Direct handler test - Location Allocation: ' + updatedLocation.animalshelters__Allocation__c);
        System.assertEquals(1, updatedLocation.animalshelters__Allocation__c, 'Direct handler call should update allocation to 1');
    }
}
