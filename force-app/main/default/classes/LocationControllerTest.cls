@isTest
public class LocationControllerTest {

    @TestSetup
    static void setupTestData(){
        
        Animal__c testAnimal = new Animal__c(Animal_Name__c = 'Tandy', Geolocation__latitude__s = 50.826425, Geolocation__longitude__s = -0.403983, Type__c = 'Rabbit', Date_of_Arrival__c = Date.today());
        Insert testAnimal;
    }
    static testMethod void testLocation() {

        String tstObj = 'Animal__c';
        String tstName = 'Animal_Name__c';
        String tstLat = 'Geolocation__latitude__s';
        String tstLong = 'Geolocation__longitude__s';
        String tstText = 'Type__c';
        String tstDate = 'Date_of_Arrival__c';

        List<Animal__c> animal = [SELECT Animal_Name__c, Geolocation__latitude__s, Geolocation__longitude__s, Type__c, Date_of_Arrival__c FROM Animal__c];
        System.assertEquals(true,animal.size()>0,'Read Animal Record Failed');
        
     
        
        List<LocationController.Location> tstLoc = new List<LocationController.Location>();
        tstLoc = LocationController.getLocation(tstObj, tstLat, tstLong, tstName, tstText, tstDate); 
        System.assertEquals(true,tstLoc.size()>0,'Read Animal Record Failed');

     
   /**     LocationController.foo(); */
        
    }
}