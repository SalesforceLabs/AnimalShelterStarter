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
        %%%NAMESPACED_ORG%%%Animal__c testRecord = new %%%NAMESPACED_ORG%%%Animal__c(%%%NAMESPACED_ORG%%%Animal_Name__c='Test', %%%NAMESPACED_ORG%%%Date_of_Arrival__c=Datetime.now());
        insert testRecord;

        // Set the multi-select picklist field to test values
        testRecord.%%%NAMESPACED_ORG%%%Behaviours__c = 'Anxious;Bad Recall';
        update testRecord;

        // Execute the method to test
        Test.startTest();
        Map<String, List<String>> badgeData =
            AnimalShelterFieldsetController.getBadgeFieldsData(testRecord.Id, '%%%NAMESPACED_ORG%%%Animal__c', new List<String>{'%%%NAMESPACED_ORG%%%Behaviours__c'});
        Test.stopTest();

        // Perform assertions
        System.assertNotEquals(null, badgeData, 'Badge data should not be null');
        System.assertEquals(2, badgeData.get('%%%NAMESPACED_ORG%%%Behaviours__c').size(), 'There should be two values in the list');
        System.assertEquals('Anxious', badgeData.get('%%%NAMESPACED_ORG%%%Behaviours__c')[0], 'The first value should be Anxious');
        System.assertEquals('Bad Recall', badgeData.get('%%%NAMESPACED_ORG%%%Behaviours__c')[1], 'The second value should be Bad Recall');
    }
}
