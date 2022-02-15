/**
 * @description       : 
 * @author            : Rajendra Singh Nagar
 * @last modified on  : 07-26-2021
 * @last modified by  : Rajendra Singh Nagar
**/
Trigger ContactTrigger on Contact(Before Insert, Before Update, Before delete, After insert, After update, After delete, After undelete){
    Switch on Trigger.OperationType{
        When After_Insert{
            // invoke contact service
            new ContactsService().aggregateAmount(Trigger.newList, Trigger.oldMap);
        }
        When After_Update{
            // invoke contact service
            new ContactsService().aggregateAmount(Trigger.newList, Trigger.oldMap
        }
        When After_delete{
            // invoke contact service
            new ContactsService().aggregateAmount(Trigger.newList, Trigger.oldMap
        }
        When After_Undelete{
            // invoke contact service
            new ContactsService().aggregateAmount(Trigger.newList, Trigger.oldMap
        }
    }
}