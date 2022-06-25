@isTest
public class AccountInfoSqolTest {
  @isTest
  public static void findAccountsATest() {
    List<Account> accList = new List<Account>();

    Account acc = new Account();

    acc.name = 'Apex LLC';
    acc.AccountNumber = 'DKS34534';
    acc.Phone = '420950295';
    accList.add(acc);

    insert accList;

    AccountInfoSqol.findAccountsA();

    List<Account> aL = [SELECT name, phone, accountNumber FROM Account];

    test.startTest();
    System.assertEquals('Apex LLC', al[0].Name);
    test.stopTest();
  }
}
