public class ContactsAggregatorSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        // Cron expression to run everyday at 1pm : '0 0 13 * * ?'
        Database.executeBatch(new contactsAggregator(), 10);
    }
}