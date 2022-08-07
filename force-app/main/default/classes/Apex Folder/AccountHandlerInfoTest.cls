@isTest 
public class AccountHandlerInfoTest {

    @isTest 
    public static void insertNewAccountTest() {

        List<String> lstStr = new List<String>();
        String str = 'Some account';
        lstStr.add(str);


        List<Account> accList = AccountHandlerInfo.insertNewAccount(lstStr);

        List<Account> newList = [select id, name from account];

        test.startTest();
        System.assertEquals(1, newList.size());
        test.stopTest();

        // test.startTest();
        // System.assertEquals(0, newList.size());
        // test.stopTest();
    }
}