@isTest
public class FSCAnimalCloneDatatableControllerTest {
    
    @TestSetup
    static void setupTestData(){
        
        Animal__c testAnimal = new Animal__c(Animal_Name__c = 'Tandy', Type__c = 'Rabbit', Date_of_Arrival__c = Date.today(), IsCloned__c = True);
        Insert testAnimal;
    }   
    
    @isTest static void testReadRecord(){
        
	    List<Animal__c> tstRecord = new List<Animal__c>();
        tstRecord = FSCAnimalCloneDatatableController.getClonedAnimals();
        System.assertEquals(true,tstRecord.size()>0,'Read Animal Record Failed');
        
    }
    
    @isTest static  void testUpdateRecord(){
        
		List<Animal__c> tstUpdate = new List<Animal__c>();
        List<Animal__c> updateAnimal = [SELECT Animal_Name__c, Type__c, Date_of_Arrival__c FROM Animal__c WHERE IsCloned__c = True];
        List<SObject> aniUp = new List<SObject>();
        for(Animal__c a : updateAnimal){
            a.Animal_Name__c = 'Tommy';
            aniUp.add(a);
        }
        tstUpdate = FSCAnimalCloneDatatableController.updateClonedRecords(updateAnimal);
        System.assertEquals(tstUpdate.get(0).Animal_Name__c, 'Tommy','Animal name !="Tommy"');
    
    }
}