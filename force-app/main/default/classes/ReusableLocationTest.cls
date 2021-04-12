@isTest
public class ReusableLocationTest {

    @isTest static void testLocation() {

        String tstObj = 'Animal__c';
        String tstName = 'Animal_Name__c';
        String tstLat = 'Geolocation__latitude__s';
        String tstLong = 'Geolocation__longitude__s';
        String tstText = 'Type__c';
        String tstDate = 'Entry_Date__c';
        
        Animal__c testAnimal = new Animal__c(Animal_Name__c = 'Tandy', Geolocation__latitude__s = 50.826425, Geolocation__longitude__s = -0.403983, Type__c = 'Rabbit', Entry_Date__c = Date.today());
        Insert testAnimal;
        
        List<Location> testingLocation = ReusableLocation.getLocation(tstObj, tstLat, tstLong, tstName, tstText, tstDate);


        

    }
}
