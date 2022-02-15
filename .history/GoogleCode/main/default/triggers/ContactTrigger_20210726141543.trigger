Trigger ContactTrigger on Contact(Before Insert, Before Update, Before delete, After insert, After update, After delete, After undelete){
    Switch on Trigger.OperationType{
        When After_Insert, After_Update, After_delete, After_Undelete{
            // invoke contact service
            ContactsService cs = new ContactsService();
            cs.aggregateAmount(trigger.new);
        }
    }
}