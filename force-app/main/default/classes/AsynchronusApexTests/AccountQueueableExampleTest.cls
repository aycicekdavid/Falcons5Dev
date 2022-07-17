
@isTest
public with sharing class AccountQueueableExampleTest {
   @TestSetup
   static void setup(){
    List<Account> accList = new List<Account>();
    for(Integer i = 0; i < 100; i++){
        Account acc = new Account();
        acc.name = 'Test Account' + i;
        accList.add(acc);
    }
    insert accList;
   }

   @isTest 
   public static void testQueueable() {
    //query for test data to pass queueable class
    List<Account> accL = [select id, Name from account where Name like 'Test Account%'];
    //Create the Queueable instance
    AccountQueueableExample aqet = new AccountQueueableExample(accL);
    Test.startTest();
    System.enqueueJob(aqet);
    Test.stopTest();

    //validate the job run
    Integer count = [select count() from account where name like '%SI%'];
    System.assertEquals(100, count);
   }
   
}
