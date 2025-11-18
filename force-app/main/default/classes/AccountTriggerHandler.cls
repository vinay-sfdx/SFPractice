public with sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {

    }
    public static void updateAccountDescription(List<Account> accountList) {
        
        for(Account acc : accountList) {
            
            // Check condition on formula field
            if(!String.isBlank(acc.Company_Size__c) && acc.Company_Size__c == 'Large') {
                acc.Description = 'High Value';
            } else {
                acc.Description = 'Normal';
            }
        }
    }
}