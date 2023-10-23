public with sharing class AccountRelatedObjects {
    
    @AuraEnabled(cacheable=true)
    //Method to Fetch Related Object Details
    public static myAccocutWrapper getRelatedObjects(Id RecordId) {
        myAccocutWrapper accWrap = new myAccocutWrapper();
        accWrap.childAccountList = [SELECT Name,Status,AnnualRevenue,Createddate From Account 
                                    WHERE ParentId =: RecordId];
        accWrap.contactList = [SELECT Name,DoNotCall,Email,Createddate From Contact 
                               WHERE AccountId =: RecordId];
        
        return myAccocutWrapper;
    }
    
    //Account Wrapper Class
    public class myAccocutWrapper {
        @AuraEnabled public List<Account> childAccountList{get;set;}
        @AuraEnabled public List<Contact> contactList{get;set;}
    }
}
