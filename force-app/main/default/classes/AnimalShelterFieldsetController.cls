/**
 * @description       :
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 11-06-2023
 * @last modified by  : Stewart Anderson
**/
public with sharing class AnimalShelterFieldsetController {
    @AuraEnabled(cacheable=true)
    public static List<FieldSetMember> getFieldSet(String sObjectName, String fieldSetName) {
        // Fetch the FieldSet and its fields
        SObjectType sObjectType = Schema.getGlobalDescribe().get(sObjectName);
        if (sObjectType == null) {
            return new List<FieldSetMember>();
        }
        DescribeSObjectResult describeResult = sObjectType.getDescribe();
        FieldSet fieldSet = describeResult.fieldSets.getMap().get(fieldSetName);
        if (fieldSet == null) {
            return new List<FieldSetMember>();
        }
        return new List<FieldSetMember>(fieldSet.getFields());
    }
}
