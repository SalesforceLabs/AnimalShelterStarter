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
    public static List<%%%NAMESPACED_ORG%%%Animal__c> getClonedAnimals() {

        if(Schema.SObjectType.%%%NAMESPACED_ORG%%%Animal__c.isAccessible()){

            List<%%%NAMESPACED_ORG%%%Animal__c> clonedAnimals = new List<%%%NAMESPACED_ORG%%%Animal__c>();
            clonedAnimals = [SELECT Id, %%%NAMESPACED_ORG%%%Animal_Name__c, %%%NAMESPACED_ORG%%%Colour__c, %%%NAMESPACED_ORG%%%Secondary_Colour__c, %%%NAMESPACED_ORG%%%Gender__c, %%%NAMESPACED_ORG%%%Current_Weight__c, %%%NAMESPACED_ORG%%%Estimated_Age__c, %%%NAMESPACED_ORG%%%Microchip__c
                                    FROM %%%NAMESPACED_ORG%%%Animal__c
                                    WHERE %%%NAMESPACED_ORG%%%IsCloned__c = True WITH SECURITY_ENFORCED ];

        return clonedAnimals;                           
        }
    return null;  
    }

    @AuraEnabled
    public static List<%%%NAMESPACED_ORG%%%Animal__c> updateClonedRecords(List<%%%NAMESPACED_ORG%%%Animal__c> updatedAnimalList ){
        system.debug('****'+updatedAnimalList);
        try {
            update updatedAnimalList;
        } catch(Exception e) {
            system.debug('******'+e.getMessage());
        }
        return updatedAnimalList;
    }
}

