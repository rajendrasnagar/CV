/**
 * @description       : 
 * @author            : Rajendra Singh Nagar
 * @last modified on  : 07-26-2021
 * @last modified by  : Rajendra Singh Nagar
**/
// Class to incorporate logic to update contacts records as per requirements
public Class ContactsService{
    public void aggregateAmount(List<Contact> newList, Map<Id,Contact> oldMap){
        // Check for state transition 
        List<Contact> eligibleRecords = new List<Contact>();
        if(oldMap == null){ // After delete 
            eligibleRecords = newList;
        }else{
            for(Contact rec: newList){
                if(rec.Amount__c != null && rec.Amount__c != oldMap.get(rec.Id).Amount__c){
                    eligibleRecords.add(rec);
                }
            }
        }

        // get related AccountIds
        List<Id> accIdList = new List<Id>();
        for(Contact con: eligibleRecords){
            accIdList.add(con.AccountId);
        }
        
        //Invoke rollupContact Service on Account
        AccountsService aser = new AccountsService();
        aser.rollupContactsAmount(accIdList);
    }

    public void updateContacts(List<Id> contactIdList){
        System.debug('***contactIdList:'+contactIdList);
        // Eligibility Check
        if(PlatformUtilityService.isListValid(contactIdList)){
            // contactIdList = PlatoformUtilityService.sanitizeIdList(contactIdList);
            List<Contact> contactsList = [Select Id from Contact where Id IN : contactIdList];
            // Update contact records
            for(Contact con: contactsList){
                con.Title='QueuableTest';
            }
            
            // Check for passed records
            System.debug('***contactsList:'+contactsList);
            Set<Id> updatedConIdSet= new Set<Id>();
            for(Database.SaveResult res: Database.update(contactsList)){
                if(res.isSuccess()){
                    updatedConIdSet.add(res.getId());
                }
            }
            System.debug('***updatecons:'+updatedConIdSet);
            // Pass records to be updated in User Records
            if(PlatformUtilityService.isListValid(new List<Id>(updatedConIdSet))){
                // Create an instance of Users Service
                UsersAsyncService us = new UsersAsyncService(updatedConIdSet);
                System.enqueueJob(us);
            }
        }
    }

}