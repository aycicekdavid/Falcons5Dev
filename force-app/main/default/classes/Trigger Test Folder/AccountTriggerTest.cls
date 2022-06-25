@isTest
public class AccountTriggerTest {
  @isTest
  private static void test1() {
    List<Account> listAcc = new List<Account>();
    Account acc1 = new Account();
    acc1.name = 'Cozy LLC';
    listAcc.add(acc1);

    Account acc2 = new Account();
    acc2.name = 'Cozy LLC';
    listAcc.add(acc2);

    Account acc3 = new Account();
    acc3.name = 'Cozy LLC';
    listAcc.add(acc3);

    insert listAcc;

    for (Account acc : listAcc) {
      acc.Description = 'test';
    }
    update listAcc;
  }
}
