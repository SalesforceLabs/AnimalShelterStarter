/**
 * @File Name          : AlertBannerControllerTest.cls
 * @Description        : 
 * @Author             : Stewart Anderson (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Stewart Anderson (Salesforce.org)
 * @Last Modified On   : 4/30/2020, 4:49:06 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/30/2020   Stewart Anderson (Salesforce.org)     Initial Version
**/
@isTest
public class AlertBannerControllerTest {
    static testMethod void testMethod1 () {
        List<%%%NAMESPACED_ORG%%%Animal_Alert__c> AlertListTest = AlertBannerController.getRelatedAlertRecords('a003z00000rlhSbAAI');
        List<%%%NAMESPACED_ORG%%%Animal_Alert__c> AlertListTest2 = AlertBannerController.getRelatedAlertRecords(null);
    }
}