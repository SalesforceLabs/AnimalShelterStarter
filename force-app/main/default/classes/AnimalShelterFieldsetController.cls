/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 01-15-2024
 * @last modified by  : Stewart Anderson
**/
public with sharing class AnimalShelterFieldsetController {
    public class FieldSetMemberWrapper {
        @AuraEnabled public String label { get; set; }
        @AuraEnabled public String apiName { get; set; }

        // Constructor to populate from a FieldSetMember
        public FieldSetMemberWrapper(FieldSetMember fsm) {
            this.label = fsm.getLabel();
            this.apiName = fsm.getFieldPath();
        }
    }

    @AuraEnabled(Cacheable=true)
    public static List<FieldSetMemberWrapper> getFieldSet(String sObjectName, String fieldSetName) {
        List<FieldSetMemberWrapper> fieldSetMemberWrappers = new List<FieldSetMemberWrapper>();

        // Fetch the FieldSet and its fields
        SObjectType sObjectType = Schema.getGlobalDescribe().get(sObjectName);
        if (sObjectType == null) {
            throw new AuraHandledException('Object type does not exist.');
        }
        DescribeSObjectResult describeResult = sObjectType.getDescribe();
        if (!describeResult.isAccessible()) {
            throw new AuraHandledException('User does not have permission to read ' + sObjectName);
        }
        Map<String, Schema.FieldSet> fieldSetMap = describeResult.fieldSets.getMap();

        if (!fieldSetMap.containsKey(fieldSetName)) {
            throw new AuraHandledException('Field set does not exist.');
        }

        FieldSet fieldSet = fieldSetMap.get(fieldSetName);
        for (Schema.FieldSetMember fsm : fieldSet.getFields()) {
            if (!fsm.getSObjectField().getDescribe().isAccessible()) {
                System.debug('No access to field: ' + fsm.getFieldPath());
                continue;
            }
            fieldSetMemberWrappers.add(new FieldSetMemberWrapper(fsm));
        }

        return fieldSetMemberWrappers;
    }

    @AuraEnabled(Cacheable=true)
    public static Map<String, List<String>> getBadgeFieldsData(String recordId, String sObjectName, List<String> badgeFieldNames) {

        // Check Object and Field Security
        SObjectType sObjectType = Schema.getGlobalDescribe().get(sObjectName);
        if (sObjectType == null) {
            throw new AuraHandledException('Object type does not exist.');
        }
        DescribeSObjectResult describeResult = sObjectType.getDescribe();
        if (!describeResult.isAccessible()) {
            throw new AuraHandledException('User does not have permission to read ' + sObjectName);
        }

        // Filter out inaccessible fields
        List<String> accessibleFields = new List<String>();
        for (String fieldName : badgeFieldNames) {
            Schema.DescribeFieldResult fieldDescribe = sObjectType.getDescribe().fields.getMap().get(fieldName).getDescribe();

            if (fieldDescribe != null && fieldDescribe.isAccessible()) {
                accessibleFields.add(fieldName);
            }
        }

        // If no fields are accessible, return empty result
        if (accessibleFields.isEmpty()) {
            return new Map<String, List<String>>();
        }

        // Fetch the record and specified fields using dynamic SOQL
        String fieldListString = String.join(accessibleFields, ',');
        String queryString = 'SELECT ' + fieldListString + ' FROM ' + sObjectName + ' WHERE Id = :recordId WITH SECURITY_ENFORCED';
        SObject record = Database.query(queryString);

        // Extract the fields and their values, split multi-select picklist values
        Map<String, List<String>> badgeFieldsData = new Map<String, List<String>>();
        for (String fieldName : badgeFieldNames) {
            // Assuming all fields are multi-select picklists
            String fieldValue = (String)record.get(fieldName);
            if (String.isNotEmpty(fieldValue)) {
                List<String> values = fieldValue.split(';');
                badgeFieldsData.put(fieldName, values);
            } else {
                // Handle null or empty case if necessary
                badgeFieldsData.put(fieldName, new List<String>());
            }
        }
        return badgeFieldsData;
    }
}