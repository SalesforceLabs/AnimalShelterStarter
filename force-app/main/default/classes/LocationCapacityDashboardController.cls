public with sharing class LocationCapacityDashboardController {

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getLocations(String siteId) {
        // If no siteId is provided, return an empty List to avoid returing all records unintentionally
        if(String.isBlank(siteId)) {
            List<animalshelters__Locations__c> locations = [
                SELECT Id, animalshelters__Name__c, animalshelters__Capacity__c, RecordTypeId,
                (SELECT Id, animalshelters__Name__c, animalshelters__Capacity__c FROM animalshelters__Locations__r)
                FROM animalshelters__Locations__c
                WHERE Id = :siteId
                OR animalshelters__Parent_Block__c = :siteId
                OR Id IN (SELECT Id FROM animalshelters__Locations__r WHERE animalshelters__Parent_Block__c IN (SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Parent_Block__c = :siteId))
                WITH SECURITY_ENFORCED
            ];
            return locations;
        }

    }

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getSites() {

        Id recordTypeId = [SELECT Id
                            FROM RecordType
                            WHERE SObjectType = 'animalshelters__Locations__c' AND DeveloperName = 'Site'].Id;
        return [SELECT Id, animalshelters__Name__c FROM animalshelters__Locations__c WHERE RecordTypeId = :recordTypeId WITH SECURITY_ENFORCED];
    }
}
