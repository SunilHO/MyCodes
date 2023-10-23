public with sharing class AccountRelatedObjects {
    
    @AuraEnabled(cacheable=true)
    //Method to Fetch Related Object Details
    public static myAccocutWrapper getRelatedObjects(Id RecordId) {
        myAccocutWrapper accWrap = new myAccocutWrapper();
        accWrap.ChildAccountList = [SELECT Name,Status,AnnualRevenue,Createddate From Account 
                                    WHERE ParentId =: RecordId];
        accWrap.ContactList = [SELECT Name,DoNotCall,Email,Createddate From Contact 
                               WHERE AccountId =: RecordId];
        
        return myAccocutWrapper;
    }
    
    //Account Wrapper Class
    public class myAccocutWrapper {
        @AuraEnabled public List<Account> ChildAccountList{get;set;}
        @AuraEnabled public List<Contact> ContactList{get;set;}
    }
}
