@isTest
public class ReusableLocationTest {

    static testMethod void testMethod1() {

        String tstObj = 'Animal__c';
        String tstName = 'Animal_Name__c';
        String tstLat = 'Geolocation__latitude__s';
        String tstLong = 'Geolocation__longitude__s';
        String tstText = 'Type__c';
        String tstDate = 'Entry_Date__c';
        
        Animal__c ani = new Animal__c();

        ani.Animal_Name__c = 'Tandy';
        ani.Geolocation__latitude__s = 50.826425;
        ani.Geolocation__longitude__s = -0.403983;
        ani.Type__c = 'Rabbit';
        ani.Entry_Date__c = Datetime.newInstance(2021, 4, 9, 0, 0, 0);

        Insert ani;

        Test.startTest();
        
            List<Location> testingLocation = ReusableLocation.getLocation(tstObj, tstLat, tstLong, tstName, tstText, tstDate);
            
        Test.stopTest();

        

    }
}
