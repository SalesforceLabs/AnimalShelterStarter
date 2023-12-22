@isTest
public class LocationControllerTest {

    @TestSetup
    static void setupTestData(){

        animalshelters__Animal__c testAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Tandy', animalshelters__Geolocation__latitude__s = 50.826425, animalshelters__Geolocation__longitude__s = -0.403983, animalshelters__Type__c = 'Rabbit', animalshelters__Date_of_Arrival__c = Date.today());
        Insert testAnimal;
    }
    static testMethod void testLocation() {

        String tstObj = 'animalshelters__Animal__c';
        String tstName = 'animalshelters__Animal_Name__c';
        String tstLat = 'animalshelters__Geolocation__latitude__s';
        String tstLong = 'animalshelters__Geolocation__longitude__s';
        String tstText = 'animalshelters__Type__c';
        String tstDate = 'animalshelters__Date_of_Arrival__c';

        List<animalshelters__Animal__c> animal = [SELECT animalshelters__Animal_Name__c, animalshelters__Geolocation__latitude__s, animalshelters__Geolocation__longitude__s, animalshelters__Type__c, animalshelters__Date_of_Arrival__c FROM animalshelters__Animal__c];
        System.assertEquals(true,animal.size()>0,'Read Animal Record Failed');

        List<LocationController.Location> tstLoc = new List<LocationController.Location>();
        tstLoc = LocationController.getLocation(tstObj, tstLat, tstLong, tstName, tstText, tstDate);
        System.assertEquals(true,String.ValueOf(tstLoc).contains('title=Tandy'),'Location Data Incorrect');

    }
}