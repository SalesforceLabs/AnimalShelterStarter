public with sharing class ShelterDashboard {

    @AuraEnabled(cacheable=true)
    public static List<animalshelters_Locations__c> getUnitLocations(){
        
        //Query to fetch Locations of RecordType Unit

        if (Schema.sObjectType.animalshelters__Locations__c.isAccessible()) {
            List<animalshelters__Locations__c> locations = [
                SELECT Id, animalshelters__Name__c, animalshelters__Parent_Block_Name__c, animalshelters__Unit_Status__c, RecordType.Name
                FROM animalshelters_Locations__c
                WHERE RecordType.DeveloperName = 'Unit'
                WITH SECURITY_ENFORCED
                ORDER BY animalshelters__Parent_Block_Name__c, animalshelters__Name__c ASC
            ];
            return locations;
        }
        return null;
    }