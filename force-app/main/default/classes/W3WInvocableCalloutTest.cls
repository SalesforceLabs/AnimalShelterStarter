@isTest
private class W3WInvocableCalloutTest {
     @isTest static void testCallout() {

        Test.setMock(HttpCalloutMock.class, new MockW3WResponseGenerator());

        %%%NAMESPACED_ORG%%%Animal__c theAnimal = new %%%NAMESPACED_ORG%%%Animal__c(%%%NAMESPACED_ORG%%%Date_of_Arrival__c = Date.Today(), %%%NAMESPACED_ORG%%%what3words__c = 'whips.vanish.store');
        insert theAnimal;

        List<%%%NAMESPACED_ORG%%%Animal__c> animals = new List<%%%NAMESPACED_ORG%%%Animal__c>();
        animals.add(theAnimal);

        test.startTest();
            W3WInvocableCallout.getW3WCoordinates(animals);
        test.stopTest();
    }
}