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
    public static List<animalshelters__Animal_Action__c> getAnimalActions(String recId, String rTypeName){

        // System.debug('recId = ' + recId);
        // System.debug('rTypeName = ' + rTypeName);

        if(Schema.sObjectType.animalshelters__Animal_Action__c.isAccessible() && Schema.sObjectType.animalshelters__Animal_Action__c.fields.name.isAccessible() && Schema.sObjectType.animalshelters__Animal_Action__c.fields.animalshelters__Action_Completed__c.isAccessible() && Schema.sObjectType.animalshelters__Animal_Action__c.fields.animalshelters__Date_Time_of_Action__c.isAccessible() && Schema.sObjectType.animalshelters__Animal_Action__c.fields.animalshelters__Description__c.isAccessible() && Schema.sObjectType.animalshelters__Animal_Action__c.fields.RecordTypeId.isAccessible() && Schema.sObjectType.animalshelters__Animal__c.isAccessible()){
            List<animalshelters__Animal_Action__c> animalActions= new List<animalshelters__Animal_Action__c>();
            boolean blnFirstTimeRound = false;
            for(RecordType rec : [SELECT Id FROM RecordType WHERE sObjectType = 'animalshelters__Animal_Action__c' and Name =:rTypeName])
            {
            if (!blnFirstTimeRound){
                List<animalshelters__Animal_Action__c> y = [SELECT Id, Name, animalshelters__Action_Completed__c, animalshelters__Date_Time_of_Action__c, animalshelters__Description__c
                                            FROM 	animalshelters__Animal_Action__c
                                            WHERE 	animalshelters__Animal__c= :recId and RecordTypeId= :rec.Id WITH SECURITY_ENFORCED ];
                for(animalshelters__Animal_Action__c z : y)
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