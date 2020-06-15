/**
 * @File Name          : AnimalActionRLClass2.apxc
 * @Description        : 
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 4/30/2020, 5:18:43 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/30/2020   Chris Rolfe (Salesforce.org)     Initial Version
**/
public with sharing class AnimalActionRLClass2 {

    @AuraEnabled
    public static List<animalshelter__Animal_Action__c> getAnimalActions(String recId, String rTypeName){
       
    // System.debug('recId = ' + recId);
    // System.debug('rTypeName = ' + rTypeName);
       
       List<animalshelter__Animal_Action__c> animalActions= new List<animalshelter__Animal_Action__c>();
       
       
       boolean blnFirstTimeRound = false;
       for(RecordType rec : [SELECT Id FROM RecordType WHERE sObjectType = 'animalshelter__Animal_Action__c' and Name =:rTypeName])
       {
           if (!blnFirstTimeRound){
               List<animalshelter__Animal_Action__c> y = [SELECT Id, Name, animalshelter__Action_Completed__c
                                                      ,animalshelter__Date_Time_of_Action__c
                                                      ,animalshelter__Description__c
                                           FROM 	animalshelter__Animal_Action__c
                                           WHERE 	animalshelter__Animal__c= :recId and RecordTypeId= :rec.Id];
       for(animalshelter__Animal_Action__c z : y)
           {
           animalActions.add(z);
           }
       blnFirstTimeRound = true;     
       }    
        
   }
   return animalActions;
}
}