trigger MovementTrigger on animalshelters__Movement__c (after insert, after update) {

    // Called upon Create of new movement
    if (Trigger.isInsert) {
        ASCS_MovementTriggerHandler.handleInsert(Trigger.newMap);
    }

    // Update an existing movement
    if (Trigger.isUpdate) {
        ASCS_MovementTriggerHandler.handleUpdate(Trigger.newMap, Trigger.oldMap);
    }
}
