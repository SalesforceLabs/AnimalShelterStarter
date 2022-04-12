@isTest
public class FSCAnimalCloneDatatableControllerTest {
    
    @TestSetup
    static void setupTestData(){
        
        %%%NAMESPACED_ORG%%%Animal__c testAnimal = new %%%NAMESPACED_ORG%%%Animal__c(%%%NAMESPACED_ORG%%%Animal_Name__c = 'Tandy', %%%NAMESPACED_ORG%%%Type__c = 'Rabbit', %%%NAMESPACED_ORG%%%Date_of_Arrival__c = Date.today(), %%%NAMESPACED_ORG%%%IsCloned__c = True);
        Insert testAnimal;
    }   
    
    @isTest static void testReadRecord(){
        
	    List<%%%NAMESPACED_ORG%%%Animal__c> tstRecord = new List<%%%NAMESPACED_ORG%%%Animal__c>();
        tstRecord = FSCAnimalCloneDatatableController.getClonedAnimals();
        System.assertEquals(true,tstRecord.size()>0,'Read Animal Record Failed');
        
    }
    
    @isTest static  void testUpdateRecord(){
        
		List<%%%NAMESPACED_ORG%%%Animal__c> tstUpdate = new List<%%%NAMESPACED_ORG%%%Animal__c>();
        List<%%%NAMESPACED_ORG%%%Animal__c> updateAnimal = [SELECT %%%NAMESPACED_ORG%%%Animal_Name__c, %%%NAMESPACED_ORG%%%Type__c, %%%NAMESPACED_ORG%%%Date_of_Arrival__c FROM %%%NAMESPACED_ORG%%%Animal__c WHERE %%%NAMESPACED_ORG%%%IsCloned__c = True];
        updateAnimal.get(0).%%%NAMESPACED_ORG%%%Animal_Name__c = 'Tommy';
        tstUpdate = FSCAnimalCloneDatatableController.updateClonedRecords(updateAnimal);
        System.assertEquals(tstUpdate.get(0).%%%NAMESPACED_ORG%%%Animal_Name__c, 'Tommy','Animal name !="Tommy"');
    
    }
}
