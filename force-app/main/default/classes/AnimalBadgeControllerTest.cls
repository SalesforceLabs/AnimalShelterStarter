@isTest
private class AnimalBadgeControllerTest {
    
    @IsTest static void testNoBadges() {
        // Set Up Test Data
        animalshelters__Animal__c testAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Test Animal', animalshelters__Date_of_Arrival__c = Date.today());
        insert testAnimal;
        
        //Test with no badges
        Test.startTest();
        Map<String, Boolean> badges = AnimalBadgeController.getRelatedBadges(testAnimal.Id);
        Test.stopTest();
        
        //Verify Results
        System.assertEquals(false, badges.get('Alert'), 'Expected no alert');
        System.assertEquals(false, badges.get('Condition'), 'Expected no Condition');
        System.assertEquals(false, badges.get('Nutrition'), 'Expected no Nutrition');
        System.assertEquals(false, badges.get('Exercise'), 'Expected no Exercise');
        System.assertEquals(false, badges.get('Treatment'), 'Expected no Treatment');
    }
    
    @IsTest static void testWithBadges() {
        // Set Up Test Data
        animalshelters__Animal__c testAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Test Animal', animalshelters__Date_of_Arrival__c = Date.today());
        insert testAnimal;
        
        animalshelters__Animal_Alert__c alert = new animalshelters__Animal_Alert__c(animalshelters__Animal__c = testAnimal.Id, animalshelters__Start_Date_Time__c = Date.today(), animalshelters__Type__c = 'General', animalshelters__Alert_Message__c = 'Test');
        animalshelters__Condition__c condition = new animalshelters__Condition__c(animalshelters__Animal__c = testAnimal.Id, animalshelters__Start_Date__c = Date.today());
        insert alert;
        insert condition;
        
        //Create a dummy record type for Action
        Id recordTypeId = Schema.SObjectType.animalshelters__Animal_Action__c.getRecordTypeInfosByName().get('Exercise').getRecordTypeId();
        animalshelters__Animal_Action__c action = new animalshelters__Animal_Action__c(animalshelters__Animal__c = testAnimal.Id, animalshelters__Date_Time_of_Action__c= Date.today(), animalshelters__Description__c = 'Test', RecordTypeId = recordTypeId);
        insert action;
        
        //Test with Badges
        Test.startTest();
        Map<String, Boolean> badges = AnimalBadgeController.getRelatedBadges(testAnimal.Id);
        Test.stopTest();
        
        //Verify Results
        System.assertEquals(true, badges.get('Alert'), 'Expected an alert');
        System.assertEquals(true, badges.get('Condition'), 'Expected a Condition');
        System.assertEquals(false, badges.get('Nutrition'), 'Expected no Nutrition');
        System.assertEquals(true, badges.get('Exercise'), 'Expected an Exercise');
        System.assertEquals(false, badges.get('Treatment'), 'Expected no Treatment');
        
    }

}