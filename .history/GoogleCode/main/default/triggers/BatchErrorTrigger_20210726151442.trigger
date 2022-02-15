/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-26-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger BatchErrorTrigger on BatchApexErrorEvent (after insert) {
    // Get async job Ids
    List<Id> asyncJobIds = new List<Id>();
    for(BatchApexErrorEvent rec: Trigger.new){
        asyncJobIds.add(rec.AsyncApexJobId);
    }
    Map<Id,AsyncApexJob> jobs = new Map<Id,AsyncApexJob>([Select Id, ApexClass.Name from AsyncApexJob Where Id IN : asyncJobIds]);
    
	// iterate over the list & get record id of failed records
    for(BatchApexErrorEvent event: Trigger.new){
        if(jobs.get(event.AsyncApexJobId).ApexClass.Name == 'ContactsAggregatorBatch'){
            // logic here
        }
    }
}