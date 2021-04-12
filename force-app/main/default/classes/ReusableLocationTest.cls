@isTest
public class ReusableLocationTest {

    @TestSetup
    static void setupTestData(){

        test.startTest();        
        Animal__c testAnimal = new Animal__c(Animal_Name__c = 'Tandy', Geolocation__latitude__s = 50.826425, Geolocation__longitude__s = -0.403983, Type__c = 'Rabbit', Date_of_Arrival__c = Date.today());
        Insert testAnimal;
        test.stopTest();
        
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
        ReusableLocation tstLoc = new ReusableLocation();
        tstLoc.List<Location>getLocation(tstObj, tstLat, tstLong, tstName, tstText, tstDate);
        System.debug(tstLoc);

    }

 
    


}
