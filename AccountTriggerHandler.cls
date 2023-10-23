public with sharing class AccountTriggerHandler{
    //To Recursive Check
    public Static Boolean isRecursive=false;
    
    //Method to create new child Account Based on Parent account Status Changes.
    public static void newChildAccountCreation(List<Account>accList){
        try{
            List<Account> childAccountList = new List<Account>();
            for(Account acc:accList){
                if(acc.Status == 'Cold'){
                    Account childAcc =new Account();
                    childAcc.Name=acc.Name;
                    childAcc.ParentId= acc.id,
                    childAcc.Status=acc.status;
                    childAccountList.add(childAcc);
                }  
            }
            //Checking Object Access & FLS
            if (Schema.sObjectType.Account.isCreateable() && Schema.sObjectType.Account.fields.Name.isCreateable() && Schema.sObjectType.Account.fields.ParentId.isCreateable() && Schema.sObjectType.Account.fields.Status.isCreateable()) {
                if(childAccountList.size() > 0) {
                    Insert childAccountList;  
                }
            }
        }
        catch(Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
        
    }
}
