/**
 * @File Name          : AnimalLocation.apxc
 * @Description        : Gets animals that are to be displayed on Animal Location Map
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 19/03/2021, 9:30:43 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    19/03/2021   Chris Rolfe (Salesforce.org)     Initial Version
**/

public with sharing class AnimalLocation {
    @AuraEnabled

    public static List<Location>getAnimalLocation(){
        if(Schema.sObjectType.Animal__c.isAccessible()){
            List<Animal__c> animals = [SELECT Id, Animal_Name__c, Geolocation__latitude__s, Geolocation__longitude__s, Type__c, Breed__c
                                        FROM Animal__c
                                        WHERE Display_on_Map__c = True];

            List<Location> loc = new List<Location>();
            for(Animal__c anilocs :animals){
                GeoLocation geoInfo = new GeoLocation();
                geoInfo.Latitude = String.ValueOf(anilocs.Geolocation__latitude__s);
                geoInfo.Longitude = String.ValueOf(anilocs.Geolocation__longitude__s);
                Location locDetail = new Location();
                locDetail.icon = 'utility:animal_and_nature';
                locDetail.title = anilocs.Animal_Name__c;
                locDetail.description = anilocs.Type__c + ' ' + anilocs.Breed__c;
                locDetail.location = geoInfo;

                loc.add(locDetail);
            }
            return loc;
        }
        System.debug('User does not have access to Animal Object. Please review access.');
        return null;


    }
    public class Location{
        @AuraEnabled
        public String icon{get;set;}
        @AuraEnabled
        public String title{get;set;}
        @AuraEnabled
        public String description{get;set;}
        @AuraEnabled
        public GeoLocation location{get;set;}
    }
    public class GeoLocation{
        @AuraEnabled
        public String Latitude{get;set;}
        @AuraEnabled
        public String Longitude{get;set;}
    }
}
        