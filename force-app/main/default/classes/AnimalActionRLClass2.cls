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
    public static List<%%%NAMESPACED_ORG%%%Animal_Action__c> getAnimalActions(String recId, String rTypeName){
       
    // System.debug('recId = ' + recId);
    // System.debug('rTypeName = ' + rTypeName);

    if(Schema.sObjectType.%%%NAMESPACED_ORG%%%Animal_Action__c.isAccessible()){
        List<%%%NAMESPACED_ORG%%%Animal_Action__c> animalActions= new List<%%%NAMESPACED_ORG%%%Animal_Action__c>();
        boolean blnFirstTimeRound = false;
        for(RecordType rec : [SELECT Id FROM RecordType WHERE sObjectType = '%%%NAMESPACED_ORG%%%Animal_Action__c' and Name =:rTypeName])
        {
           if (!blnFirstTimeRound){
               List<%%%NAMESPACED_ORG%%%Animal_Action__c> y = [SELECT Id, Name, %%%NAMESPACED_ORG%%%Action_Completed__c, %%%NAMESPACED_ORG%%%Date_Time_of_Action__c, %%%NAMESPACED_ORG%%%Description__c
                                           FROM 	%%%NAMESPACED_ORG%%%Animal_Action__c
                                           WHERE 	%%%NAMESPACED_ORG%%%Animal__c= :recId and RecordTypeId= :rec.Id];
            for(%%%NAMESPACED_ORG%%%Animal_Action__c z : y)
                {
                    animalActions.add(z);
                }
            blnFirstTimeRound = true;     
            }    
        }
        return animalActions;
    }
    return null;   
    }
}