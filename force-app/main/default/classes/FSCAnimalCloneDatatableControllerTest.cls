@isTest
public class FSCAnimalCloneDatatableControllerTest {
    
    @TestSetup
    static void setupTestData(){
        
        Animal__c testAnimal = new Animal__c(Animal_Name__c = 'Tandy', Type__c = 'Rabbit', Date_of_Arrival__c = Date.today(), IsCloned__c = True);
        Insert testAnimal;
    }   
    
    static testMethod void testReadRecord(){

        List<Animal__c> animal = [SELECT Animal_Name__c, Type__c, Date_of_Arrival__c FROM Animal__c WHERE IsCloned__c = True];
        System.assertEquals(true,animal.size()>0,'Read Animal Record Failed');
        
	    List<Animal__c> tstRecord = new List<Animal__c>();
        tstRecord = FSCAnimalCloneDatatableController.getClonedAnimals();
        System.assert(!tstRecord.isEmpty(), 'List should not be empty'); 
        
    }
    
    static testMethod void testUpdateRecord(){
        
		List<Animal__c> updateAnimal = [SELECT Animal_Name__c, Type__c, Date_of_Arrival__c FROM Animal__c WHERE IsCloned__c = True];
        
		//updateAnimal.IsCloned__c = False;
       // update updateAnimal;
        
    }
}