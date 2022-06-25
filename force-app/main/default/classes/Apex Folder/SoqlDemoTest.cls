@isTest
public class SoqlDemoTest {
  @isTest
  private static void test1() {
    //1.Prepare the data
    //dml
    //we can call method to prpare data
    List<Account> accList = new List<Account>();
    account acc1 = new Account();
    acc1.Name = 'acc1';
    accList.add(acc1);

    account acc2 = new Account();
    acc2.Name = 'acc2';
    accList.add(acc2);

    account acc3 = new Account();
    acc3.Name = 'acc3';
    accList.add(acc3);

    insert accList;

    //2.Call the actual method
    SoqlDemo.accountSOQL_1();
  }

  @isTest
  private static void test2() {
    List<Account> accList = new List<Account>();
    account acc1 = new Account();
    acc1.Name = 'acc1';
    acc1.Phone = '29836429';
    acc1.AccountNumber = 'AC4857';
    accList.add(acc1);

    account acc2 = new Account();
    acc2.Name = 'acc2';
    acc2.Phone = '29836429';
    acc2.AccountNumber = 'AC4857';
    accList.add(acc2);

    account acc3 = new Account();
    acc3.Name = 'acc3';
    acc3.Phone = '29836429';
    acc3.AccountNumber = 'AC4857';
    accList.add(acc3);

    insert accList;

    SoqlDemo.accountSOQL_2();
  }

  private static void test3() {
    account acc1 = new Account();
    acc1.Name = 'acc1';
    acc1.Phone = '29836429';
    acc1.AccountNumber = 'AC4857';

    insert acc1;

    SoqlDemo.accountSOQL_3();
  }
}
