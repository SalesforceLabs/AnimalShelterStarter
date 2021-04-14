/**
 * @File Name          : LocationController.apxc
 * @Description        : Gets records that are to be displayed on Location Map
 * @Author             : Chris Rolfe (Salesforce.org)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce.org)
 * @Last Modified On   : 09/04/2021, 17:38
 * @Modification Log   : Removed need for WHERE, LIMITS to 100 records
 * Ver       Date            Author      		    Modification
 * 1.0    09/04/2021   Chris Rolfe (Salesforce.org)     Initial Version
 * 1.1    09/04/2021   Chris Rolfe (Salesforce.org)     Updated SOQL
**/

public with sharing class LocationController {

    @AuraEnabled
    public static List<Location> getLocation(String varObj, String varLat, String varLong, String varName, String varDescText, String varDescDate){

        //Build SOQL String
        String listOfFields = varName + ', ' + varLat + ', ' + varLong + ', ' + varDescText + ', ' + varDescDate;
        System.debug(listOfFields);
        String whereClause = varLat + ' != null';
        System.debug(whereClause);
        
        //Get 100 records
        if(Schema.describeSObjects(new List<String>{varObj})[0].isAccessible()){
            String queryString = 'SELECT ' + listOfFields + ' FROM ' + varObj + ' WHERE ' + whereClause + ' ORDER BY ' + varDescDate + ' DESC LIMIT 100';
            System.debug(queryString);
            List<sObject> myData = Database.query(String.escapeSingleQuotes(queryString));
            System.debug(myData);
            
            //Get Field Label of varDescDate field
            List<Schema.DescribeSObjectResult> dsr = Schema.describeSObjects(new List<String> {varObj});
            String objectLabel = dsr[0].getLabel();
            Map<String, Schema.SObjectField> allFields = dsr[0].fields.getMap();
            String fieldLabel = allFields.get(varDescDate).getDescribe().getLabel();
            System.debug(objectLabel + ' ' + fieldLabel);

            //Build Location records
            List<Location> loc = new List<Location>();
            for(sObject locs :myData){
                GeoLocation geoInfo = new GeoLocation();
                geoInfo.Latitude = String.ValueOf(locs.get(varLat));
                geoInfo.Longitude = String.ValueOf(locs.get(varLong));
                Location locDetail = new Location();
                locDetail.icon = 'utility:animal_and_nature';
                locDetail.title = String.ValueOf(locs.get(varName));
                locDetail.description = locs.get(varDescText) + ' - ' + fieldLabel + ': ' + String.ValueOf(locs.get(varDescDate));
                locDetail.location = geoInfo;

                loc.add(locDetail);
            }
            return loc;

        }
        System.debug('User does not have access to this object');
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