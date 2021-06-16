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
    public static List<Animal__c> getClonedAnimals() {

        if(Schema.SObjectType.Animal__c.isAccessible()){

            List<Animal__c> clonedAnimals = new List<Animal__c>();

            clonedAnimals = [SELECT Id, Animal_Name__c, Colour__c, Secondary_Colour__c, Gender__c, Current_Weight__c, Estimated_Age__c, Microchip__c
                                    FROM Animal__c
                                    WHERE IsCloned__c = True];
        }
        return clonedAnimals;
    }
    return null;

    @AuraEnabled
    public static boolean updateRecords( List < Animal__c > updatedAnimalList ){

        try {
            update updatedAnimalList;
            return true;
        } catch(Exception e) {
            return false;
        }
        
    }

}

