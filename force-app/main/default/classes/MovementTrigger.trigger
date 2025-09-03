trigger MovementTrigger on animalshelters__Movement__c (after insert, after update) {

    // Check if the trigger is enabled via the Custom Setting
    animalshelters__Animal_Shelter_Settings__c triggerSettings = animalshelters__Animal_Shelter_Settings__c.getInstance();

    Boolean isEnabled = (triggerSettings != null && triggerSettings.animalshelters__Movement_Trigger_Enabled__c != null)
        ? triggerSettings.animalshelters__Movement_Trigger_Enabled__c
        : true; // Default to true if setting doesn't exist
    if (!isEnabled) {
            return;
    }


    // Called upon Create of new movement
    if (Trigger.isInsert) {
        ASCS_MovementTriggerHandler.handleInsert(Trigger.newMap);
    }

    // Update an existing movement
    if (Trigger.isUpdate) {
        ASCS_MovementTriggerHandler.handleUpdate(Trigger.newMap, Trigger.oldMap);
    }
}
