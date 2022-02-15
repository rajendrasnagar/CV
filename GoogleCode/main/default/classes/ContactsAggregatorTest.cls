/**
 * @description       : 
 * @author            : Rajendra Singh Nagar
 * @last modified on  : 07-26-2021
 * @last modified by  : Rajendra Singh Nagar
**/
@isTest
private class ContactsAggregatorTest {
    /**
     * Setup method to create test data. Ideally, Test Data factory / Template based test framework should be used.
     */
    @TestSetup
    private static void makeData(){
        // Used to bulk testing
        List<Contact> conList = new List<Contact>();
        Integer recordSize = PlatformUtilityService.isSandbox()?200:2;
        for(Integer i = 0; i < recordSize; i++){
            conList.add(new Contact(lastName='last name-'+i));
        }
        insert conList;
    }
    @isTest
    public static void testBatch(){
        Test.startTest();
            // invoke batch 
            Id batchId = Database.executeBatch(new ContactsAggregatorBatch());

        Test.stopTest();
            System.assert(![select id from AsyncApexJob where id = : batchId].isEmpty(), 'Batch class is not queued.');
            System.debug('***consize:'+[select Id from Contact].size());
            for(Contact con: [select Id, Title from Contact]){
                System.assertEquals('Modified by batch', con.Title, 'Record is not updated properly.');
            }
    }
}