@isTest
private class W3WInvocableCalloutTest {
     @isTest static void testCallout() {

        Test.setMock(HttpCalloutMock.class, new MockW3WResponseGenerator());

        Animal__c theAnimal = new Animal__c(Date_of_Arrival__c = Date.Today(), what3words__c = 'whips.vanish.store');
        insert theAnimal;

        List<Animal__c> animals = new List<Animal__c>();
        animals.add(theAnimal);

        test.startTest();
            W3WInvocableCallout.getW3WCoordinates(animals);
        test.stopTest();
    }
}