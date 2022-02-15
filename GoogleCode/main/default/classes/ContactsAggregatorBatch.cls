/**
 * @description       : 
 * @author            : Rajendra Singh Nagar
 * @group             : 
 * @last modified on  : 07-26-2021
 * @last modified by  : Rajendra Singh Nagar
**/
public class ContactsAggregatorBatch implements Database.batchable<SObject>, Database.Stateful, Database.RaisesPlatformEvents{
    private Set<Id> successRecSet = new Set<Id>();
    private Set<Id> failedRecSet = new Set<Id>();
    public Database.QueryLocator start(Database.batchableContext bc){
        return Database.getQueryLocator('select id from Contact');
    }
    public void execute(Database.batchableContext bc, List<SObject> scope){
        List<Contact> conList = new List<Contact>();
        for(Contact con: (List<Contact>) scope){
            con.Title = 'Modified by batch';
            conList.add(con);
            failedRecSet.add(con.Id);
        }
        
        // Use Database.SaveResult for transaction management
        for(Database.SaveResult rec: Database.update(conList)){
            if(rec.isSuccess()){
                successRecSet.add(rec.getId());
                failedRecSet.remove(rec.getId());
            }
        }
    }
    public void finish(Database.batchableContext bc){
        System.debug('***finish');
        PlatformUtilityService.sendBatchNotification(new List<String>{'rajendra.mitu06@gmail.com'}, successRecSet.size(), failedRecSet.size(), failedRecSet);
    }
}