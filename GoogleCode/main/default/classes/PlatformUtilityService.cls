/**
 * @description       : 
 * @author            : Rajendra Singh Nagar
 * @last modified on  : 07-26-2021
 * @last modified by  : Rajendra Singh Nagar
**/
Public inherited sharing class PlatformUtilityService{
    /**
     * Set<specific type> can't be casted to Set<Object>, so isSetValid() can't be created.
    */
    Public static boolean isListValid(List<Object> objectList){
        return (objectList != null && !objectList.isEmpty());
    }
    
    /**
     * Removes nulls & duplicate entries
    */
    public static list<Id> sanitizeIdList(List<Id> objectList){
        Set<Id> uniqueSet = new Set<Id>(objectList);
        uniqueSet.remove(null);
        return new List<Id>(uniqueSet);
    }

    /**
     * Check production or sandbox instance
     */
    public static boolean isSandbox(){
        // Check the organization record
        return [select isSandbox from Organization].isSandbox;
    }

    /**
     * Check state transition
     */
    public static List<SObject> changedRecords(List<SObject> newRecList, Map<Id, SObject> oldRecMap, List<SObjectField> fields){
        if(oldRecMap == null)
            return newRecList;
        List<SObject> changedRecords = new List<SObject>();
        for(SObject rec: newRecList){
            for(SObjectField field: fields){
                if(rec.get(field)!=oldRecMap.get((Id) rec.get('Id')).get(field)){
                    changedRecords.add(rec);
                }
            }
        }
        return changedRecords;
    }
    /**
     * Send email utility
     */
    public static void sendBatchNotification(List<String> toAddresses, Integer success, Integer fail , Set<Id> failedSet){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(toAddresses);
        email.setSubject('Batch processing completed.');
        email.setPlainTextBody('Total records processed- success:'+success
                                +'\nTotal records processed- failure:'+fail
                                +'\nFailed Records:'+failedSet.toString());
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
            
    }
}