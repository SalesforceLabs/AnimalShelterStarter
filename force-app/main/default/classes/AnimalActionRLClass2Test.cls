/**
 * @File Name          : AnimalActionRLClass2Test.cls
 * @Description        :
 * @Author             : Stewart Anderson (Salesforce.org)
 * @Group              :
 * @Last Modified By   : Stewart Anderson (Salesforce.org)
 * @Last Modified On   : 4/30/2020, 5:18:43 PM
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    4/30/2020   Stewart Anderson (Salesforce.org)     Initial Version
**/
@isTest
public class AnimalActionRLClass2Test {

    @IsTest
    static void TestingActionListGeneration2(){

        Test.startTest();

        List<animalshelters__Animal_Action__c> TestingList = AnimalActionRLClass2.getAnimalActions('a003z00000rlhSbAAI','Treatment');

        Test.stopTest();

    }


}