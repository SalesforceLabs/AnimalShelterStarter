/**
 * @File Name          : AlertBannerController.cls
 * @Description        : Controller for use with Animal Alert Lightning Component
 * @Author             : Stewart Anderson
 * @Group              : Salesforce.org
 * @Last Modified By   : Stewart Anderson (Salesforce.org)
 * @Last Modified On   : 4/7/2020, 8:50:48 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/6/2020   Stewart Anderson     Initial Version
**/
public with sharing class AlertBannerController {
   
    /**
    * @description Returns a list of related Animal Alerts for a given Animal record ID
    * @author Stewart Anderson (Salesforce.org) | 4/7/2020 
    * @param parentId 
    * @return List<animalshelter__Animal_Alert__c> 
    **/
    @AuraEnabled
    public static List<animalshelter__Animal_Alert__c> getRelatedAlertRecords(Id parentId) {
        if(parentId != null){
            List<animalshelter__Animal_Alert__c> AlertList = [SELECT Id, animalshelter__Alert_Message__c,animalshelter__Start_Date_Time__c,animalshelter__End_Date_Time__c FROM animalshelter__Animal_Alert__c WHERE animalshelter__Animal__c = :parentId AND animalshelter__Start_Date_Time__c <= TODAY AND (animalshelter__End_Date_Time__c >= TODAY OR animalshelter__End_Date_Time__c = NULL) LIMIT 20];
            return AlertList;
        } else {
            return null;
        }
    }
}