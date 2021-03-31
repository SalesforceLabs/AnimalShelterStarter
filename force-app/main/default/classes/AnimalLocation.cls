/**
 * @File Name          : AnimalLocation.apxc
 * @Description        : Gets animals that are to be displayed on Animal Location Map
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 31/03/2021, 3:53:43 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    19/03/2021   Chris Rolfe (Salesforce.org)     Initial Version
 * 1.1    31/03/2021   Chris Rolfe (Salesforce.org)     Limit on SQOL Query set to 100
**/

public with sharing class AnimalLocation {
    @AuraEnabled

    public static List<Location>getAnimalLocation(){
       if(Schema.sObjectType.%%%NAMESPACED_ORG%%%Animal__c.isAccessible()){ 
            List<%%%NAMESPACED_ORG%%%Animal__c> animals = [SELECT Id, %%%NAMESPACED_ORG%%%Animal_Name__c, %%%NAMESPACED_ORG%%%Geolocation__latitude__s, %%%NAMESPACED_ORG%%%Geolocation__longitude__s, %%%NAMESPACED_ORG%%%Type__c, %%%NAMESPACED_ORG%%%Breed__c
                                        FROM %%%NAMESPACED_ORG%%%Animal__c
                                        WHERE %%%NAMESPACED_ORG%%%Display_on_Map__c = True
                                        ORDER BY CreatedDate DESC
                                        LIMIT 100];

            List<Location> loc = new List<Location>();
            for(%%%NAMESPACED_ORG%%%Animal__c anilocs :animals){
                GeoLocation geoInfo = new GeoLocation();
                geoInfo.Latitude = String.ValueOf(anilocs.%%%NAMESPACED_ORG%%%Geolocation__latitude__s);
                geoInfo.Longitude = String.ValueOf(anilocs.%%%NAMESPACED_ORG%%%Geolocation__longitude__s);
                Location locDetail = new Location();
                locDetail.icon = 'utility:animal_and_nature';
                locDetail.title = anilocs.%%%NAMESPACED_ORG%%%Animal_Name__c;
                locDetail.description = anilocs.%%%NAMESPACED_ORG%%%Type__c + ' ' + anilocs.%%%NAMESPACED_ORG%%%Breed__c;
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