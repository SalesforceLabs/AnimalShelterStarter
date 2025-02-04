public with sharing class SetupCheckController {

    @AuraEnabled(cacheable=true)
    public static Integer hasBreedRecords() {
        if(Schema.SObjectType.animalshelters__Breed__c.isAccessible()){
            return [SELECT COUNT() FROM animalshelters__Breed__c];
            }
        return null;
    }
    
    @AuraEnabled(cacheable=true)
    public static Boolean hasLocationRecords() {
        if(Schema.SObjectType.animalshelters__Locations__c.isAccessible()){
            return [SELECT COUNT() FROM animalshelters__Locations__c] > 0;
            }
        return null;
        }

    @AuraEnabled(cacheable=true)
    public static String shelterAccountCheck() {
        if (Schema.SObjectType.animalshelters__Animal_Shelter_Settings__c.isAccessible()) {
            animalshelters__Animal_Shelter_Settings__c animal_settings = animalshelters__Animal_Shelter_Settings__c.getInstance();

            // If Default Shelter Name is Empty, return Advisory message
            if (String.isBlank(animal_settings.Default_Shelter_Name__c)) {
                return 'Advisory: Default Shelter Name not set';
            }

            // Get Account Name
            String accountName = animal_settings.Default_Shelter_Name__c;

            // Query to see if account exists
            list<Account> existingAccount = [SELECT Id FROM Account WHERE Name = :accountName LIMIT 1];

            if (!existingAccount.isEmpty()) {
                return 'PASS: Matching Shelter (Account) record to Default Shelter Name found'; // Account Exists
            } else {
                return 'FAIL: No matching Shelter (Account) record found to Default Shelter Name'; // Account Does Not Exist
            }

        }
    
    return null;
    }

    @AuraEnabled(cacheable=true)
    public static Map<String, String> checkPathSettings() {
        Map<String, String> results = new Map<String, String>();
        try {
            MetadataService.MetadataPort service = createMetadataService();
            
            // Specify the object names to check
            String[] objectNames = new String[] { 'Adoption_Profile__c', 'Adoption__c', 'Animal_Action__c' };
            
            // Retrieve metadata for the specified objects
            MetadataService.ReadResult result = service.readMetadata('PathAssistant', objectNames);
            
            if (result != null && result.records != null) {
                for (MetadataService.Metadata metadata : result.records) {
                    MetadataService.PathAssistant path = (MetadataService.PathAssistant) metadata;

                    if (path != null && path.active) {
                        results.put(path.fullName, 'PASS');
                    } else {
                        results.put(path != null ? path.fullName : 'Unknown', 'FAIL');
                    }
                }
            }
        } catch (Exception e) {
            results.put('Error', 'Failed to retrieve metadata: ' + e.getMessage());
        }
        return results;
    }

    private static MetadataService.MetadataPort createMetadataService() {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;
    }




}