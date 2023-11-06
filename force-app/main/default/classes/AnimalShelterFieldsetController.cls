/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 11-06-2023
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

    @AuraEnabled(cacheable=true)
    public static List<FieldSetMemberWrapper> getFieldSet(String sObjectName, String fieldSetName) {
        List<FieldSetMemberWrapper> fieldSetMemberWrappers = new List<FieldSetMemberWrapper>();

        // Fetch the FieldSet and its fields
        SObjectType sObjectType = Schema.getGlobalDescribe().get(sObjectName);
        if (sObjectType == null) {
            throw new AuraHandledException('Object type does not exist.');
        }
        DescribeSObjectResult describeResult = sObjectType.getDescribe();
        Map<String, Schema.FieldSet> fieldSetMap = describeResult.fieldSets.getMap();

        if (!fieldSetMap.containsKey(fieldSetName)) {
            throw new AuraHandledException('Field set does not exist.');
        }

        FieldSet fieldSet = fieldSetMap.get(fieldSetName);
        for (Schema.FieldSetMember fsm : fieldSet.getFields()) {
            fieldSetMemberWrappers.add(new FieldSetMemberWrapper(fsm));
        }

        return fieldSetMemberWrappers;
    }
}
