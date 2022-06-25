@isTest
public class DmlDemoTest {
  @isTest
  public static void dmlInserDemo_stndObjectTest() {
    DmlDemo.dmlInserDemo_stndObject();

    List<Account> accList = [SELECT id, Name FROM account];

    System.assertEquals('SoftInnovas', accList[0].Name);
    System.assertEquals(1, accList.size());
  }

  @isTest
  public static void dmlRpdateDemo_1Test() {
    DmlDemo.dmlRpdateDemo_1();

    List<Account> accList = [SELECT id, name FROM Account];

    System.assertEquals('Salesforce Inc.3336', accList[0].Name);

    System.assertEquals(1, accList.size());
  }

  @isTest
  public static void dmlUpdateDemo_2Test() {
    //create records.
    //1.Prepare data. We can not access any data from the org.
    //2.call methods

    Account acc = new Account();
    acc.Name = 'SoftInnovas Inc.';
    insert acc;

    DmlDemo.dmlUpdateDemo_2();

    List<Contact> con = [SELECT id, lastname, name FROM contact];

    System.assertEquals('Biden', con[0].LastName);
    System.assertEquals(1, con.size());
  }

  @isTest
  static void dmlUpdateDemo3Test() {
    Account acc = new Account(name = 'SoftInnovas2');
    insert acc;

    DmlDemo.dmlUpdateDemo_3();

    List<Account> accList = [SELECT id, name FROM account];

    System.assertEquals('SoftInnovas Inc.ZZZ', accList[0].name);
    System.assertEquals(1, accList.size());
  }

  @isTest
  public static void dmlMultipleRecordInsert_right1Test() {
    DmlDemo.dmlMultipleRecordInsert_right1();

    List<Account> acc = [SELECT id, name FROM Account];

    System.assertEquals(3, acc.size());
  }

  @isTest
  public static void dmlUpdateDemo_2_coTest() {
    salesforce_project__c sp = new salesforce_project__c();
    sp.Project_Name__c = 'Group Beatles';
    // sp.Description__c = 'All 50% are great learners, still';
    // sp.Status__c = 'New';
    insert sp;

    DmlDemo.dmlUpdateDemo_2_co();

    List<salesforce_ticket__c> sft = [
      SELECT priority__c
      FROM salesforce_ticket__c
    ];

    System.assertEquals('High', sft[0].priority__c);
  }

  @isTest
  public static void dmlMultipleRecordInsert_right2() {
    DmlDemo.dmlMultipleRecordInsert_right2();

    List<Account> accL = [SELECT id FROM account];

    System.assertEquals(150, accL.size());
  }

  @isTest
  public static void dmlMultipleRecordUpdate_rightTest() {
    List<Account> accL = new List<Account>();
    Account acc = new Account(name = 'name1');
    accL.add(acc);
    insert accL;

    DmlDemo.dmlMultipleRecordUpdate_right();

    List<Account> accList = [SELECT id, name FROM account];

    System.assertEquals('name1via B.0', accList[0].Name);
  }

  @isTest
  public static void deleteAcc() {
    List<Account> accL = new List<Account>();
    Account acc = new Account(name = 'name1');
    accL.add(acc);
    insert accL;

    DmlDemo.deleteAcc();

    List<Account> accLst = [SELECT id, name FROM account];

    System.assertEquals(1, accL.size());
  }
}
