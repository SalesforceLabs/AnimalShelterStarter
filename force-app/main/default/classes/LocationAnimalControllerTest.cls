/**
 * @File Name          : LocationAnimalControllerTest.cls
 * @Description        : Test Class for LocationAnimalController
 * @Author             : Chris Rolfe
 * @Last Modified By   : 
 * @Last Modified On   : 
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    22/08/2024   Chris Rolfe     Initial Version
**/
@isTest
public class LocationAnimalControllerTest {

    @testSetup
    static void setupTestData() {
        // Get Unit RecordType for Locations
        Id locRecordTypeUnit = Schema.SObjectType.animalshelters__Locations__c.getRecordTypeInfosByName().get('Unit').getRecordTypeId();
        Id locRecordTypeBlock = Schema.SObjectType.animalshelters__Locations__c.getRecordTypeInfosByName().get('Block').getRecordTypeId();


        // Create a Location of type Unit
        animalshelters__Locations__c unitLocation = new animalshelters__Locations__c(animalshelters__Name__c = 'Unit 1', RecordTypeId = locRecordTypeUnit);
        insert unitLocation;

        // Create another Location of type Block
        animalshelters__Locations__c blockLocation = new animalshelters__Locations__c(animalshelters__Name__c = 'Block 1', RecordTypeId = locRecordTypeBlock);
        insert blockLocation;

        // Create an Animal
        animalshelters__Animal__c animal1 = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Molly', animalshelters__Date_of_Arrival__c = Date.today());
        animalshelters__Animal__c animal2 = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Furby', animalshelters__Date_of_Arrival__c = Date.today());
        insert new List<animalshelters__Animal__c>{animal1, animal2};

        // Create Movement records for the Unit Location
        animalshelters__Movement__c movement1 = new animalshelters__Movement__c(animalshelters__Animal__c = animal1.Id, animalshelters__Location__c = unitLocation.Id, animalshelters__Current__c = true);
        animalshelters__Movement__c movement2 = new animalshelters__Movement__c(animalshelters__Animal__c = animal2.Id, animalshelters__Location__c = unitLocation.Id, animalshelters__Current__c = true);
        insert new List<Movement__c>{movement1, movement2};
    }

    @isTest
    static void testGetAnimalsInLocation_UnitWithAnimals() {
        // Fetch the Unit Location created in test setup
        animalshelters__Locations__c unitLocation = [SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Unit 1' LIMIT 1];

        // Call the method
        Test.startTest();
        List<animalshelters__Movement__c> movements = LocationAnimalController.getAnimalsInLocation(unitLocation.Id);
        Test.stopTest();

        // Verify the result
        System.assertEquals(2, movements.size(), 'There should be two movements for Unit 1');
        System.assertEquals('Molly', movements[0].animalshelters__Animal__r.animalshelters__Animal_Name__c, 'First animal should be Lion');
        System.assertEquals('Furby', movements[1].animalshelters__Animal__r.animalshelters__Animal_Name__c, 'Second animal should be Tiger');
    }

    @isTest
    static void testGetAnimalsInLocation_UnitWithoutAnimals() {
        // Create a new Unit Location without any animals
        RecordType unitRecordType = [SELECT Id FROM RecordType WHERE DeveloperName = 'Unit' AND SObjectType = 'animalshelters__Locations__c' LIMIT 1];
        animalshelters__Locations__c emptyUnitLocation = new animalshelters__Locations__c(animalshelters__Name__c = 'Empty Unit', RecordTypeId = unitRecordType.Id);
        insert emptyUnitLocation;

        // Call the method
        Test.startTest();
        List<animalshelters__Movement__c> movements = LocationAnimalController.getAnimalsInLocation(emptyUnitLocation.Id);
        Test.stopTest();

        // Verify the result
        System.assertEquals(0, movements.size(), 'There should be no movements for the empty unit');
    }

    @isTest
    static void testGetAnimalsInLocation_NonUnitLocation() {
        // Fetch the Block Location created in test setup
        animalshelters__Locations__c blockLocation = [SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Block 1' LIMIT 1];

        // Call the method
        Test.startTest();
        List<animalshelters__Movement__c> movements = LocationAnimalController.getAnimalsInLocation(blockLocation.Id);
        Test.stopTest();

        // Verify the result
        System.assertEquals(0, movements.size(), 'There should be no movements because the location is not a Unit');
    }
}