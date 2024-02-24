public with sharing class ShelterDashboard {

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getUnitLocations(){
        
        //Query to fetch Locations of RecordType Unit

        if (Schema.SObjectType.animalshelters__Locations__c.isAccessible()) {
            List<animalshelters__Locations__c> locations = [
                SELECT Id, animalshelters__Name__c, animalshelters__Parent_Block_Name__c, RecordType.Name, animalshelters__Internal_Animal_Lookup__r.animalshelters__Animal_Name__c, animalshelters__Internal_Animal_Lookup__r.animalshelters__Animal_Status__c 
                FROM animalshelters__Locations__c
                WHERE RecordType.DeveloperName = 'Unit'
                WITH SECURITY_ENFORCED
                ORDER BY animalshelters__Parent_Block_Name__c, animalshelters__Name__c ASC
            ];
            return locations;
        }
        return null;

    }
}