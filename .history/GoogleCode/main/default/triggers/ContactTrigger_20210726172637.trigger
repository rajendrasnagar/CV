/**
 * @description       : 
 * @author            : Rajendra Singh Nagar
 * @last modified on  : 07-26-2021
 * @last modified by  : Rajendra Singh Nagar
**/
Trigger ContactTrigger on Contact(Before Insert, Before Update, Before delete, After insert, After update, After delete, After undelete){
    Switch on Trigger.OperationType{
        When After_Insert, After_Update, After_delete, After_Undelete{
            // Check for state transition 
            List<Contact> eligibleRecords = new List<Contact>();
            if(Trigger.oldMap == null){ // After delete 
                eligibleRecords = Trigger.new;
            }else{
                for(Contact rec: Trigger.new){
                    if(rec.Amount__c != null && rec.Amount__c != trigger.oldMap.get(rec.Id).Amount__c){
                        eligibleRecords.add(rec);
                    }
                }
            }
            // invoke contact service
            ContactsService cs = new ContactsService();
            cs.aggregateAmount(eligibleRecords);
        }
    }
}