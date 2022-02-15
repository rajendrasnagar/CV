public WITHOUT SHARING class Jb_ResumesService {
    @AuraEnabled(cacheable=true)
    public static Jb_Resume__c getResume(Id resumeId){
        System.debug('***resume:'+resumeId);
        return [SELECT Id, (SELECT AccountType__c, Link__c FROM Socials__r ORDER BY Order__c ASC) FROM Jb_Resume__c WHERE Id=:resumeId];
    }
}