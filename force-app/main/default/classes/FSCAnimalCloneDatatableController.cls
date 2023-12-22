/**
 * @File Name          : FSCAnimalCloneDatatableController.cls
 * @Description        :
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              :
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 11/06/2021, 08:27:00 AM
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    11/06/2021   Chris Rolfe (Salesforce.org)     Initial Version
**/

public with sharing class FSCAnimalCloneDatatableController {

    @AuraEnabled
    public static List<animalshelters__Animal__c> getClonedAnimals() {

        if(Schema.SObjectType.animalshelters__Animal__c.isAccessible()){

            List<animalshelters__Animal__c> clonedAnimals = new List<animalshelters__Animal__c>();
            clonedAnimals = [SELECT Id, animalshelters__Animal_Name__c, animalshelters__Colour__c, animalshelters__Secondary_Colour__c, animalshelters__Gender__c, animalshelters__Current_Weight__c, animalshelters__Estimated_Age__c, animalshelters__Microchip__c
                                    FROM animalshelters__Animal__c
                                    WHERE animalshelters__IsCloned__c = True WITH SECURITY_ENFORCED ];

        return clonedAnimals;
        }
    return null;
    }

    @AuraEnabled
    public static List<animalshelters__Animal__c> updateClonedRecords(List<animalshelters__Animal__c> updatedAnimalList ){
        system.debug('****'+updatedAnimalList);
        try {
            update updatedAnimalList;
        } catch(Exception e) {
            system.debug('******'+e.getMessage());
        }
        return updatedAnimalList;
    }
}