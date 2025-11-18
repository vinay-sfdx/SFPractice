trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    AccountTriggerHandler.updateAccountDescription(Trigger.new);
    if(Trigger.isAfter) {
        if(Trigger.isInsert || Trigger.isUpdate) {
            AccountTriggerHandler.createContactsForAccounts(Trigger.new);
        }
    }
}
