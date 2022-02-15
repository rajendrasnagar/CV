/**
 * @description       : 
 * @author            : Rajendra Singh Nagar
 * @last modified on  : 07-26-2021
 * @last modified by  : Rajendra Singh Nagar
**/
@isTest
private class ContactsServiceTest {
    @TestSetup
    private static void createRecords(){
        // Create contact records
        List<Contact> conList = new List<Contact>();
        Integer recSize = PlatformUtilityService.isSandbox()?200:2;
        // Create account records
        Account acc = new Account(Name='Demo Account', Rating = 'hot');
        insert acc;
        for(Integer i = 0; i < recSize; i++){
            conList.add(new Contact(
            	LastName='lastName'+i,
                AccountId = acc.Id
            ));
        }
        insert conList;
    }

    @isTest
    private static void aggregateAmountTest(){
        // Get Contacts to be passed 
        List<Contact> conList = new List<Contact>();
        for(Contact rec: [Select Id, Amount__c from Contact]){
            conList.add(new Contact(
                Id = rec.Id,
                Amount__c = 100
            ));
        }
        // Run tests in Start & end Context
        Test.startTest();
            update conList;
        Test.stopTest();
    }

	@isTest
    private static void updateContacts(){
        Test.startTest();
            // fetch contact records & invoke method
            Map<Id, Contact> conMap = new Map<Id, Contact>([Select Id from Contact]);
            // Instantiate ContactsService & invoke the service method
            ContactsService cs = new ContactsService();
            cs.updateContacts(new List<Id>(conMap.keyset()));
        Test.stopTest();
        // Assert for contact update
        for(Contact con: [select Title from Contact]){
            System.AssertEquals('QueuableTest', con.Title, 'Title is not matching');
        }
        // Assert for user field update
        System.Assert([Select AboutMe from User where Id =: UserInfo.getUserId()].AboutMe.contains('003'), 'AboutMe doesn\'t contains contact key');
    }
}