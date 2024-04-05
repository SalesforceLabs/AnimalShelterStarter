/**
 * @File Name          : AnimalBadgeController.cls
 * @Description        :
 * @Author             : Chris Rolfe (Salesforce)
 * @Last Modified By   : 
 * @Last Modified On   :
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    01/04/2024   Chris Rolfe (Salesforce)     Initial Version
**/
public with sharing class AnimalBadgeController {

    @AuraEnabled(Cacheable=true)
    public static Map<String, Boolean> getRelatedBadges(Id animalId) {
        Map<String, Boolean> badges = new Map<String, Boolean>{
            'Alert' => false,
            'Condition' => false,
            'Nutrition' => false,
            'Exercise' => false,
            'Treatment' => false,
            'Vaccination' => false
        };

        // Check for Alerts with no end date
        if(Schema.SObjectType.animalshelters__Animal_Alert__c.isAccessible() && Schema.SObjectType.animalshelters__Animal_Alert__c.fields.Animalshelters__End_Date_Time__c.isAccessible()) {
            List<animalshelters__Animal_Alert__c> alerts = [SELECT Id
                                                            FROM animalshelters__Animal_Alert__c
                                                            WHERE animalshelters__Animal__c = :animalId
                                                            AND animalshelters__End_Date_Time__c = NULL
                                                            WITH SECURITY_ENFORCED];
            // System.debug(alerts);
            if(!alerts.isEmpty()) {
                badges.put('Alert', true);
            }
        }

        // Check for Conditions that have no end date
        if(Schema.SObjectType.animalshelters__Condition__c.isAccessible() && Schema.SObjectType.animalshelters__Condition__c.fields.Animalshelters__End_Date_Time__c.isAccessible()) {
        List<animalshelters__Condition__c> conditions = [SELECT Id
                                                        FROM animalshelters__Condition__c
                                                        WHERE animalshelters__Animal__c = :animalId
                                                        AND animalshelters__End_Date_Time__c = NULL
                                                        WITH SECURITY_ENFORCED];
            // System.debug(conditions);
            if(!conditions.isEmpty()) {
                badges.put('Condition', true);
            }
        }

        // Check for Action Records and RecordTypes
        if(Schema.SObjectType.animalshelters__Animal_Action__c.isAccessible() && Schema.SObjectType.animalshelters__Animal_Action__c.fields.animalshelters__Treatment_Type__c.isAccessible() && Schema.SObjectType.animalshelters__Animal_Action__c.fields.animalshelters__Action_Completed__c.isAccessible()) {
        List<animalshelters__Animal_Action__c> actions = [SELECT Id, RecordType.Name, animalshelters__Treatment_Type__c
                                                            FROM animalshelters__Animal_Action__c
                                                            WHERE animalshelters__Animal__c = :animalId
                                                            AND animalshelters__Action_Completed__c = FALSE
                                                            WITH SECURITY_ENFORCED];
            // System.debug(actions);
            for(animalshelters__Animal_Action__c action : actions) {
                if(action.RecordType.Name == 'Nutrition') {
                    badges.put('Nutrition', true);
                } else if(action.RecordType.Name == 'Exercise'){
                    badges.put('Exercise', true);
                } else if(action.RecordType.Name == 'Treatment' && action.animalshelters__Treatment_Type__c == 'Vaccination'){
                    badges.put('Vaccination', true);
                } else if(action.RecordType.Name == 'Treatment' && action.animalshelters__Treatment_Type__c != 'Vaccination'){
                    badges.put('Treatment', true);
                }
            }
            //System.debug(badges);
        }
        return badges;
    }
}