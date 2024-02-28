public with sharing class LocationCapacityDashboardController {

    @AuraEnabled(cacheable=true)
    public static List<animalshelters__Locations__c> getLocations(String siteId) {
        // If no siteId is provided, return an empty List to avoid returing all records unintentionally
        System.debug('siteId: ' + siteId);
        if (siteId == null) {
            return new List<animalshelters__Locations__c>();
        } else {
            return [
                SELECT Id, animalshelters__Name__c, animalshelters__Capacity__c, RecordType.Name,
                (SELECT Id, animalshelters__Name__c, animalshelters__Capacity__c FROM animalshelters__Locations__r)
                FROM animalshelters__Locations__c
                WHERE RecordType.DeveloperName = 'Block' AND animalshelters__Parent_Block__c = :siteId
                WITH SECURITY_ENFORCED
                ORDER BY animalshelters__Name__c ASC
            ];
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
