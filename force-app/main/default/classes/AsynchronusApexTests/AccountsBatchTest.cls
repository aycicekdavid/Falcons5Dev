@isTest
public with sharing class AccountsBatchTest {

    @isTest
    public static void testMethod1() {

        List<Account> accList = new List<Account>();

        for(integer i = 0; i<903; i++){
            Account acc = new Account();

            if(math.mod(i, 2)== 0){
                acc.Name = 'accSome'+i;
                acc.Description = 'batch'+ i + 'some1'; 
                acc.active__c = 'No';
                accList.add(acc);

            }else if(math.mod(i, 2)!= 0){
                acc.Name = 'accSome'+i;
                acc.Description = 'batch'+ i + 'some1'; 
                acc.active__c = 'Yes';
                accList.add(acc);
            }    
        }
        insert accList;

        Test.startTest();
        AccountBatch ab = new AccountBatch();
        Database.executeBatch(ab, 950);
        Test.stopTest();

        List<Account> accounts = [select id, description from Account where active__c = 'Yes'];
        for(account acc : accounts){
            System.assert(acc.Description.containsIgnoreCase('batch'));
        }
    }  
}