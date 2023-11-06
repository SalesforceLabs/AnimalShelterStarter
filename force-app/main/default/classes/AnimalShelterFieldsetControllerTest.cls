/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 11-06-2023
 * @last modified by  : Stewart Anderson
**/
@isTest
private class AnimalShelterFieldsetControllerTest {

    @isTest static void testGetFieldSet() {
        // Setup test data
        // Since Schema and FieldSets cannot be created in test methods,
        // we'll assume there's an existing object and field set available.

        // Execute the method to test
        Test.startTest();
        List<AnimalShelterFieldsetController.FieldSetMemberWrapper> result =
            AnimalShelterFieldsetController.getFieldSet('%%%NAMESPACED_ORG%%%Animal__c', 'animal_cage_card_field_set');
        Test.stopTest();

        // Perform assertions
        System.assertNotEquals(null, result, 'The result should not be null');
        System.assertNotEquals(0, result.size(), 'The result should have elements');
    }

    @isTest static void testGetBadgeFieldsData() {
        // Setup test data
        // Create a record for the sObject you're testing against
        YourSObject testRecord = new YourSObject(Name='Test', /* other fields */);
        insert testRecord;

        // Set the multi-select picklist field to test values
        testRecord.YourMultiSelectField__c = 'Value1;Value2';
        update testRecord;

        // Execute the method to test
        Test.startTest();
        Map<String, List<String>> badgeData =
            AnimalShelterFieldsetController.getBadgeFieldsData(testRecord.Id, 'YourSObject', new List<String>{'YourMultiSelectField__c'});
        Test.stopTest();

        // Perform assertions
        System.assertNotEquals(null, badgeData, 'Badge data should not be null');
        System.assertEquals(2, badgeData.get('YourMultiSelectField__c').size(), 'There should be two values in the list');
        System.assertEquals('Value1', badgeData.get('YourMultiSelectField__c')[0], 'The first value should be Value1');
        System.assertEquals('Value2', badgeData.get('YourMultiSelectField__c')[1], 'The second value should be Value2');
    }
}
