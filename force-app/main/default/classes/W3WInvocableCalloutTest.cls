/**
 * @description       :
 * @author            : Chris Rolfe
 * @group             :
 * @last modified on  : 10-17-2023
 * @last modified by  : Stewart Anderson
**/
@IsTest
private class W3WInvocableCalloutTest {
     @IsTest
     static void testCallout() {

        Test.setMock(HttpCalloutMock.class, new MockW3WResponseGenerator());

        animalshelters__Animal__c theAnimal = new animalshelters__Animal__c(animalshelters__Date_of_Arrival__c = Date.today(), animalshelters__what3words__c = 'whips.vanish.store');
        insert theAnimal;

        List<animalshelters__Animal__c> animals = new List<animalshelters__Animal__c>();
        animals.add(theAnimal);

        Test.startTest();
            W3WInvocableCallout.getW3WCoordinates(animals);
        Test.stopTest();
    }
}