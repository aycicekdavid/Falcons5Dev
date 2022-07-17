public with sharing class AccountBatch implements Database.Batchable<SObject>, Database.Stateful {

    public Integer count = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){

        Database.QueryLocator ql = Database.getQueryLocator([select id, description from Account where Active__c = 'Yes']);
        return ql;
    }

    public void execute(Database.BatchableContext bc, List<Account> scope) {

        List<Account> updateAccounts = new List<Account>();

        for(Account acc : scope){
            acc.Description += '... Updated via Batch Apex!2';
            updateAccounts.add(acc);
            count++;
        }
        if(!updateAccounts.isEmpty()){
            update updateAccounts;
        }   
    }

    public void finish(Database.BatchableContext bc){

        System.debug('done with updating all the accounts!');

        //how many records will be actually updated?

        System.debug('# of records updated :' + count);
    }
}
