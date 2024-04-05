/**
 * @File Name          : AlertBannerController.cls
 * @Description        : Controller for use with Animal Alert Lightning Component
 * @Author             : Stewart Anderson
 * @Group              : Salesforce.org
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 15/7/2020, 9:46:48 AM
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    4/6/2020   Stewart Anderson     Initial Version
 * 1.1    15/7/2020  Chris Rolfe          removed namespace reference
 * 1.2    3/2/2022   Stewart Anderson     Added CRUD Permission Checks
**/
public with sharing class AlertBannerController {

    /**
    * @description Returns a list of related Animal Alerts for a given Animal record ID
    * @author Stewart Anderson (Salesforce.org) | 4/7/2020
    * @param parentId
    * @return List<animalshelters__Animal_Alert__c>
    **/
    @AuraEnabled
    public static List<animalshelters__Animal_Alert__c> getRelatedAlertRecords(Id parentId) {

        if(parentId == null){
            return null;
        }

        if(Schema.SObjectType.animalshelters__Animal_Alert__c.isAccessible() && Schema.SObjectType.animalshelters__Animal_Alert__c.fields.animalshelters__Alert_Message__c.isAccessible() && Schema.SObjectType.animalshelters__Animal_Alert__c.fields.animalshelters__Start_Date_Time__c.isAccessible() && Schema.SObjectType.animalshelters__Animal_Alert__c.fields.animalshelters__End_Date_Time__c.isAccessible()){

            List<animalshelters__Animal_Alert__c> AlertList = [SELECT Id, animalshelters__Alert_Message__c,animalshelters__Start_Date_Time__c,animalshelters__End_Date_Time__c,animalshelters__Severity_Level__c,animalshelters__Type__c FROM animalshelters__Animal_Alert__c WHERE animalshelters__Animal__c = :parentId AND animalshelters__Start_Date_Time__c <= TODAY AND (animalshelters__End_Date_Time__c >= TODAY OR animalshelters__End_Date_Time__c = NULL)  WITH SECURITY_ENFORCED LIMIT 20];
            return AlertList;

        }

        return null;
    }
}