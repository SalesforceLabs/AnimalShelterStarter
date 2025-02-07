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
        System.assertEquals(false, badges.get('OverWeight'), 'Expected no result of OverWeight');
        System.assertEquals(false, badges.get('UnderWeight'), 'Expected no result of UnderWeight');
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
        System.assertEquals(false, badges.get('OverWeight'), 'Expected no result of OverWeight');
        System.assertEquals(false, badges.get('UnderWeight'), 'Expected no result of UnderWeight');
        
    }

    @isTest static void testAnimalOverWeight() {
        // Setup Test Data
    
        // Create a Breed record
        animalshelters__Breed__c breed = new animalshelters__Breed__c(Name = 'Test Breed', animalshelters__Type__c = 'Dog', animalshelters__Species__c = 'Labrador', animalshelters__Ideal_Minimum_Weight_kgs__c = 10.0, animalshelters__Ideal_Maximum_Weight_kgs__c = 20.0);
        insert breed;

        // Create an Animal record that is overweight
        animalshelters__Animal__c overweightAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Overweight Animal', animalshelters__Date_of_Arrival__c = Date.today(), animalshelters__Breed_Lookup__c = breed.Id, animalshelters__Current_Weight__c = 22.0);
        insert overweightAnimal;

        //Test with Badges
        Test.startTest();
        Map<String, Boolean> badges = AnimalBadgeController.getRelatedBadges(overweightAnimal.Id);
        Test.stopTest();

        //Verify Results
        System.assertEquals(true, badges.get('OverWeight'), 'Expected a result of OverWeight');
        System.assertEquals(false, badges.get('UnderWeight'), 'Expected no result of UnderWeight');
    }

    @isTest static void testAnimalUnderWeight() {
        // Setup Test Data
    
        // Create a Breed record
        animalshelters__Breed__c breed = new animalshelters__Breed__c(Name = 'Test Breed', animalshelters__Type__c = 'Dog', animalshelters__Species__c = 'Labrador', animalshelters__Ideal_Minimum_Weight_kgs__c = 10.0, animalshelters__Ideal_Maximum_Weight_kgs__c = 20.0);
        insert breed;

        // Create an Animal record that is underweight
        animalshelters__Animal__c underweightAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Underweight Animal', animalshelters__Date_of_Arrival__c = Date.today(), animalshelters__Breed_Lookup__c = breed.Id, animalshelters__Current_Weight__c = 8.0);
        insert underweightAnimal;

        //Test with Badges
        Test.startTest();
        Map<String, Boolean> badges = AnimalBadgeController.getRelatedBadges(underweightAnimal.Id);
        Test.stopTest();

        //Verify Results
        System.assertEquals(false, badges.get('OverWeight'), 'Expected no result of OverWeight');
        System.assertEquals(true, badges.get('UnderWeight'), 'Expected a result of UnderWeight');
    }

    @isTest static void testAnimalNormalWeight() {
        // Setup Test Data
    
        // Create a Breed record
        animalshelters__Breed__c breed = new animalshelters__Breed__c(Name = 'Test Breed', animalshelters__Type__c = 'Dog', animalshelters__Species__c = 'Labrador', animalshelters__Ideal_Minimum_Weight_kgs__c = 10.0, animalshelters__Ideal_Maximum_Weight_kgs__c = 20.0);
        insert breed;

        // Create an Animal record that is within the ideal range
        animalshelters__Animal__c normalweightAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Normal Weight Animal', animalshelters__Date_of_Arrival__c = Date.today(), animalshelters__Breed_Lookup__c = breed.Id, animalshelters__Current_Weight__c = 15.0);
        insert normalweightAnimal;

        //Test with Badges
        Test.startTest();
        Map<String, Boolean> badges = AnimalBadgeController.getRelatedBadges(normalweightAnimal.Id);
        Test.stopTest();

        //Verify Results
        System.assertEquals(false, badges.get('OverWeight'), 'Expected no result of OverWeight');
        System.assertEquals(false, badges.get('UnderWeight'), 'Expected no result of UnderWeight');
    }

}