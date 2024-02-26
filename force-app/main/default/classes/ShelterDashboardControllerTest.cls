/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class ShelterDashboardControllerTest {

    @isTest
    static void testGetLocationWithAnimals() {
        //Get RecordType ID
        RecordType rt = [SELECT Id FROM RecordType WHERE SObjectType = 'animalshelters__Locations__c' AND DeveloperName = 'Unit' LIMIT 1];

        // Insert test data from Animal
        animalshelters__Animal__c animal1 = new animalshelters__Animal__c(
            animalshelters__Animal_Name__c = 'TestAnimal1',
            animalshelters__Date_of_Arrival__c = Date.today(),
            animalshelters__Animal_Status__c = 'New');
            insert animal1;

        animalshelters__Animal__c animal2 = new animalshelters__Animal__c(
            animalshelters__Animal_Name__c = 'TestAnimal2',
            animalshelters__Date_of_Arrival__c = Date.today(),
            animalshelters__Animal_Status__c = 'Adopted');
            insert animal2;

        // Insert test data from Locations with references to Animal Records
        animalshelters__Locations__c location1 = new animalshelters__Locations__c(
            animalshelters__Name__c = 'TestLocation1',
            animalshelters__Animal_Record_Id__c = animal1.Id,
            RecordTypeId=rt.Id);
            insert location1;

        animalshelters__Locations__c location2 = new animalshelters__Locations__c(
            animalshelters__Name__c = 'TestLocation2',
            animalshelters__Animal_Record_Id__c = animal2.Id,
            RecordTypeId=rt.Id);
            insert location2;

        //Perfrom the test call
        Test.startTest();
            List<ShelterDashboardController.DashboardWrapper> results = ShelterDashboardController.getLocationWithAnimals();
        Test.stopTest();

        // Assertions to ensure correct data retreival and mapping
        System.assertEquals(2, results.size(), 'There should be two location results');

        // Assert that each location has the correct animal mapped
        for(ShelterDashboardController.DashboardWrapper result : results) {
            if(result.locationName == 'TestLocation1') {
                System.assertEquals('TestAnimal1', result.animalName, 'Animal Name is incorrect');
                System.assertEquals('New', result.animalStatus, 'Animal Status is incorrect');
            } else if(result.locationName == 'TestLocation2') {
                System.assertEquals('TestAnimal2', result.animalName, 'Animal Name is incorrect');
                System.assertEquals('Adopted', result.animalStatus, 'Animal Status is incorrect');
            }
        }
    
    }
}