/**
 * @File Name          : ReleaseLocation.apxc
 * @Description        : Gets movements records that are to be displayed on Release Location Map
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 19/03/2021, 9:30:43 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    19/03/2021   Chris Rolfe (Salesforce.org)     Initial Version
**/

public with sharing class ReleaseLocation {
    @AuraEnabled

    public static List<Location>getReleaseLocation(){
        if(Schema.sObjectType.%%%NAMESPACED_ORG%%%Movement__c.isAccessible()){
            List<%%%NAMESPACED_ORG%%%Movement__c> movements = [SELECT Id, %%%NAMESPACED_ORG%%%Animal_Name__c, %%%NAMESPACED_ORG%%%Release_Location__latitude__s, %%%NAMESPACED_ORG%%%Release_Location__longitude__s, %%%NAMESPACED_ORG%%%End_Date__c
                                        FROM %%%NAMESPACED_ORG%%%Movement__c
                                        WHERE %%%NAMESPACED_ORG%%%Display_on_Map__c = True];

            List<Location> loc = new List<Location>();
            for(%%%NAMESPACED_ORG%%%Movement__c rellocs :movements){
                GeoLocation geoInfo = new GeoLocation();
                geoInfo.Latitude = String.ValueOf(rellocs.%%%NAMESPACED_ORG%%%Release_Location__latitude__s);
                geoInfo.Longitude = String.ValueOf(rellocs.%%%NAMESPACED_ORG%%%Release_Location__longitude__s);
                Location locDetail = new Location();
                locDetail.icon = 'utility:animal_and_nature';
                locDetail.title = rellocs.%%%NAMESPACED_ORG%%%Animal_Name__c;
                locDetail.description = 'Release Date:' + ' ' +String.Valueof(rellocs.%%%NAMESPACED_ORG%%%End_Date__c);
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