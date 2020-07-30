/**
 * @File Name          : AnimalActionRLClass2.apxc
 * @Description        : 
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 15/7/2020, 9:47:43 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    30/4/2020   Chris Rolfe (Salesforce.org)     Initial Version
 * 1.1    15/7/2020   Chris Rolfe                      removed namepsace reference
**/
public with sharing class AnimalActionRLClass2 {

    @AuraEnabled
    public static List<Animal_Action__c> getAnimalActions(String recId, String rTypeName){
       
    // System.debug('recId = ' + recId);
    // System.debug('rTypeName = ' + rTypeName);
       
       List<Animal_Action__c> animalActions= new List<Animal_Action__c>();
       
       
       boolean blnFirstTimeRound = false;
       for(RecordType rec : [SELECT Id FROM RecordType WHERE sObjectType = 'Animal_Action__c' and Name =:rTypeName])
       {
           if (!blnFirstTimeRound){
               List<Animal_Action__c> y = [SELECT Id, Name, Action_Completed__c
                                                      ,Date_Time_of_Action__c
                                                      ,Description__c
                                           FROM 	Animal_Action__c
                                           WHERE 	Animal__c= :recId and RecordTypeId= :rec.Id];
       for(Animal_Action__c z : y)
           {
           animalActions.add(z);
           }
       blnFirstTimeRound = true;     
       }    
        
   }
   return animalActions;
}
}