public with sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {

    }
    // scenario: update same record based on condition on same record.
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

    // scenario: create child records based on condition on parent record.
    public static void createContactsForAccounts(List<Account> accountList) {
        List<Contact> contactList = new List<Contact>();
        
        for(Account acc : accountList) {
            // Check condition on formula field
            if(!String.isBlank(acc.Industry) && acc.Industry == 'Technology') {
                Contact con = new Contact();
                con.FirstName = 'Tech';
                con.LastName = 'Contact';
                con.AccountId = acc.Id;
                contactList.add(con);
            }
        }
        
        if(!contactList.isEmpty()) {
            insert contactList;
        }
    }
}