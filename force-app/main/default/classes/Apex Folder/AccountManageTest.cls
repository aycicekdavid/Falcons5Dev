@isTest 
public class AccountManageTest {
    @isTest 
    public static void updateRecordsTest() {
        List<Account> accountHandler = new List<Account>();
        Account acc = new Account();
        acc.name = 'some account';
        acc.Description = 'some account created. Congrats!';
        accountHandler.add(acc);
        insert accountHandler;

        list<account> a = AccountManage.updateRecords(accountHandler);

        list<account> ac = [select id, name, createddate from Account];

        test.startTest();
        System.assertEquals(1, ac.size());
        test.stopTest();
        
    }
    

    
}