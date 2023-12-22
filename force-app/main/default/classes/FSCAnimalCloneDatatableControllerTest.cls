@isTest
public class FSCAnimalCloneDatatableControllerTest {

    @TestSetup
    static void setupTestData(){

        animalshelters__Animal__c testAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Tandy', animalshelters__Type__c = 'Rabbit', animalshelters__Date_of_Arrival__c = Date.today(), animalshelters__IsCloned__c = True);
        Insert testAnimal;
    }

    @isTest static void testReadRecord(){

	    List<animalshelters__Animal__c> tstRecord = new List<animalshelters__Animal__c>();
        tstRecord = FSCAnimalCloneDatatableController.getClonedAnimals();
        System.assertEquals(true,tstRecord.size()>0,'Read Animal Record Failed');

    }

    @isTest static  void testUpdateRecord(){

		List<animalshelters__Animal__c> tstUpdate = new List<animalshelters__Animal__c>();
        List<animalshelters__Animal__c> updateAnimal = [SELECT animalshelters__Animal_Name__c, animalshelters__Type__c, animalshelters__Date_of_Arrival__c FROM animalshelters__Animal__c WHERE animalshelters__IsCloned__c = True];
        updateAnimal.get(0).animalshelters__Animal_Name__c = 'Tommy';
        tstUpdate = FSCAnimalCloneDatatableController.updateClonedRecords(updateAnimal);
        System.assertEquals(tstUpdate.get(0).animalshelters__Animal_Name__c, 'Tommy','Animal name !="Tommy"');

    }
}