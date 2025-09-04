/**
 * @File Name          : AnimalBadgeController.cls
 * @Description        :
 * @Author             : Chris Rolfe (Salesforce)
 * @Last Modified By   : 
 * @Last Modified On   :
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    01/04/2024   Chris Rolfe (Salesforce)     Initial Version
 * 1.1    05/02/2025   Chris Rolfe (Salesforce)     Added Over and Under Weight, Updated Vaccination to 30 days from Today
**/
public with sharing class AnimalBadgeController {

    @AuraEnabled(cacheable=true)
    public static Map<String, Boolean> getRelatedBadges(Id animalId) {
        Map<String, Boolean> badges = new Map<String, Boolean>{
            'Alert' => false,
            'Condition' => false,
            'Nutrition' => false,
            'Exercise' => false,
            'Treatment' => false,
            'Vaccination' => false,
            'OverWeight' => false,
            'UnderWeight' => false
        };

        // Check for Alerts with no end date
        if(Schema.sObjectType.animalshelters__Animal_Alert__c.isAccessible() && Schema.sObjectType.animalshelters__Animal_Alert__c.fields.Animalshelters__End_Date_Time__c.isAccessible()) {
            List<animalshelters__Animal_Alert__c> alerts = [SELECT Id
                                                            FROM animalshelters__Animal_Alert__c
                                                            WHERE animalshelters__Animal__c = :animalId
                                                            AND animalshelters__End_Date_Time__c = null
                                                            WITH SECURITY_ENFORCED];
            // System.debug(alerts);
            if(!alerts.isEmpty()) {
                badges.put('Alert', true);
            }
        }

        // Check for Condiitons that have no end date
        if(Schema.sObjectType.animalshelters__Condition__c.isAccessible() && Schema.sObjectType.animalshelters__Condition__c.fields.Animalshelters__End_Date_Time__c.isAccessible()) {
        List<animalshelters__Condition__c> conditions = [SELECT Id
                                                        FROM animalshelters__Condition__c
                                                        WHERE animalshelters__Animal__c = :animalId
                                                        AND animalshelters__End_Date_Time__c = null
                                                        WITH SECURITY_ENFORCED];
            // System.debug(conditions);
            if(!conditions.isEmpty()) {
                badges.put('Condition', true);
            }
        }

        // Check for Action Records and RecordTypes
        if(Schema.sObjectType.animalshelters__Animal_Action__c.isAccessible() && Schema.sObjectType.animalshelters__Animal_Action__c.fields.animalshelters__Treatment_Type__c.isAccessible() && Schema.sObjectType.animalshelters__Animal_Action__c.fields.animalshelters__Action_Completed__c.isAccessible()) {
        List<animalshelters__Animal_Action__c> actions = [SELECT Id, RecordType.Name, animalshelters__Treatment_Type__c, animalshelters__Date_Time_of_Action__c
                                                            FROM animalshelters__Animal_Action__c
                                                            WHERE animalshelters__Animal__c = :animalId
                                                            AND animalshelters__Action_Completed__c = false
                                                            WITH SECURITY_ENFORCED];
            // System.debug(actions);
            for(animalshelters__Animal_Action__c action : actions) {
                if(action.RecordType.Name == 'Nutrition') {
                    badges.put('Nutrition', true);
                } else if(action.RecordType.Name == 'Exercise'){
                    badges.put('Exercise', true);
                } else if(action.RecordType.Name == 'Treatment' && action.animalshelters__Treatment_Type__c == 'Vaccination' && action.animalshelters__Date_Time_of_Action__c >= System.today() && action.animalshelters__Date_Time_of_Action__c <= System.today().addDays(30) ){
                    badges.put('Vaccination', true);
                } else if(action.RecordType.Name == 'Treatment' && action.animalshelters__Treatment_Type__c != 'Vaccination'){
                    badges.put('Treatment', true);
                }
            }
            //System.debug(badges);
        }
        if(Schema.sObjectType.animalshelters__Animal__c.isAccessible() && Schema.sObjectType.animalshelters__Breed__c.isAccessible() && Schema.sObjectType.animalshelters__Animal__c.fields.animalshelters__Current_Weight__c.isAccessible() && Schema.sObjectType.animalshelters__Breed__c.fields.animalshelters__Ideal_Minimum_Weight_kgs__c.isAccessible()) {
        List<animalshelters__Animal__c> animal = [SELECT Id, animalshelters__Breed_Lookup__c, animalshelters__Current_Weight__c, animalshelters__Average_Ideal_or_Target_Weight_kgs__c
                                                FROM animalshelters__Animal__c
                                                WHERE Id = :animalId
                                                WITH SECURITY_ENFORCED
                                                LIMIT 1];
        //System.debug(animal);

        
        List<animalshelters__Breed__c> breed = [SELECT Id, animalshelters__Ideal_Minimum_Weight_kgs__c, animalshelters__Ideal_Maximum_Weight_kgs__c
                                                FROM animalshelters__Breed__c
                                                WHERE Id = :animal[0].animalshelters__Breed_Lookup__c
                                                WITH SECURITY_ENFORCED
                                                LIMIT 1];
        //System.debug(breed);
        
        if(animal.size() > 0 && breed.size() > 0) {
            Decimal currentWeight = animal[0].animalshelters__Current_Weight__c;
            Decimal minWeight = breed[0].animalshelters__Ideal_Minimum_Weight_kgs__c;
            Decimal maxWeight= breed[0].animalshelters__Ideal_Maximum_Weight_kgs__c;
            Decimal idealWeight = animal[0].animalshelters__Average_Ideal_or_Target_Weight_kgs__c;

            if(currentWeight != null && minWeight != null && maxWeight!= null) {
                if(currentWeight < minWeight) {
                    badges.put('UnderWeight', true);
                } else if(currentWeight > maxWeight) {
                    badges.put('OverWeight', true);
                }
            }
        }
    }
    //System.debug(badges);
    return badges;
    }
}