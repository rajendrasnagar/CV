/**
 * @description       : 
 * @author            : Rajendra Singh Nagar
 * @last modified on  : 07-26-2021
 * @last modified by  : Rajendra Singh Nagar
**/
public with Sharing class AccountsService {
    public void rollupContactsAmount(List<Id> accIds){
        // Input check
        if(PlatformUtilityService.isListValid(accIds)){
            // remove all nulls
            accIds = (List<Id>)PlatformUtilityService.sanitizeIdList(accIds);
            // perform aggreagate query to rollup 'field' field on all related Contacts
            List<Account> updateList = new List<Account>();
            for(AggregateResult ar: [Select AccountId, sum(Amount__c) amt from Contact where AccountId IN :accIds group by AccountId]){
                updateList.add(new Account(
                	Id = (Id)ar.get('AccountId'),
                    AnnualRevenue = (Decimal)ar.get('amt')
                ));
            }
			// We need all/none
            try{
                update updateList;
            }catch(DMLException de){
				throw new AccountsServiceException('Issue with updating Account records. Check with Admin. '+de.getMessage());
            }
        }
    }
    public class AccountsServiceException extends Exception{}
}