@isTest
public class LocationControllerTest {

    @TestSetup
    static void setupTestData(){
        
        %%%NAMESPACED_ORG%%%Animal__c testAnimal = new %%%NAMESPACED_ORG%%%Animal__c(%%%NAMESPACED_ORG%%%Animal_Name__c = 'Tandy', %%%NAMESPACED_ORG%%%Geolocation__latitude__s = 50.826425, %%%NAMESPACED_ORG%%%Geolocation__longitude__s = -0.403983, %%%NAMESPACED_ORG%%%Type__c = 'Rabbit', %%%NAMESPACED_ORG%%%Date_of_Arrival__c = Date.today());
        Insert testAnimal;
    }
    static testMethod void testLocation() {

        String tstObj = '%%%NAMESPACED_ORG%%%Animal__c';
        String tstName = '%%%NAMESPACED_ORG%%%Animal_Name__c';
        String tstLat = '%%%NAMESPACED_ORG%%%Geolocation__latitude__s';
        String tstLong = '%%%NAMESPACED_ORG%%%Geolocation__longitude__s';
        String tstText = '%%%NAMESPACED_ORG%%%Type__c';
        String tstDate = '%%%NAMESPACED_ORG%%%Date_of_Arrival__c';

        List<%%%NAMESPACED_ORG%%%Animal__c> animal = [SELECT %%%NAMESPACED_ORG%%%Animal_Name__c, %%%NAMESPACED_ORG%%%Geolocation__latitude__s, %%%NAMESPACED_ORG%%%Geolocation__longitude__s, %%%NAMESPACED_ORG%%%Type__c, %%%NAMESPACED_ORG%%%Date_of_Arrival__c FROM %%%NAMESPACED_ORG%%%Animal__c];
        System.assertEquals(true,animal.size()>0,'Read Animal Record Failed');
        
        List<LocationController.Location> tstLoc = new List<LocationController.Location>();
        tstLoc = LocationController.getLocation(tstObj, tstLat, tstLong, tstName, tstText, tstDate); 
        System.assertEquals(true,String.ValueOf(tstLoc).contains('title=Tandy'),'Location Data Incorrect');
        
    }
}
