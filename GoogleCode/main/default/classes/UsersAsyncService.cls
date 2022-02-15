Public With Sharing Class UsersAsyncService implements Queueable{
    Private Set<Id> conIdSet;
    Public UsersAsyncService(Set<Id> conIdSet){
        this.conIdSet = conIdSet;
    }
    
    Public void execute(QueueableContext qc){
        List<User> userList = [Select Id, AboutMe from User where id = :UserInfo.getUserId()];
        userList[0].AboutMe = conIdSet.toString();
        
        // Update success results
        Set<Id> successIdSet = new Set<Id>();
        for(Database.SaveResult sr : Database.update(userList)){
            if(sr.isSuccess()){
                successIdSet.add(sr.getId());
            }
        }
        
        // Send email for successful records
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{'rajendra.mitu06@gmail.com'});
        email.setSubject('User Updated');
        email.setPlainTextBody('User Records are updated successfully.\n Total Users updated:'+successIdSet.toString());
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}