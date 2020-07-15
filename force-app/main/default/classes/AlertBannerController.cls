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
**/
public with sharing class AlertBannerController {
   
    /**
    * @description Returns a list of related Animal Alerts for a given Animal record ID
    * @author Stewart Anderson (Salesforce.org) | 4/7/2020 
    * @param parentId 
    * @return List<Animal_Alert__c> 
    **/
    @AuraEnabled
    public static List<Animal_Alert__c> getRelatedAlertRecords(Id parentId) {
        if(parentId != null){
            List<Animal_Alert__c> AlertList = [SELECT Id, Alert_Message__c,Start_Date_Time__c,End_Date_Time__c FROM Animal_Alert__c WHERE Animal__c = :parentId AND Start_Date_Time__c <= TODAY AND (End_Date_Time__c >= TODAY OR End_Date_Time__c = NULL) LIMIT 20];
            return AlertList;
        } else {
            return null;
        }
    }
}