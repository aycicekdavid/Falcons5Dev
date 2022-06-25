@isTest
public class AccConAndOppOperationsTest {
  @isTest
  public static void fetchAllAccountsTest() {
    //provide the data
    List<Account> accList = new List<Account>();
    Account acc = new Account();
    acc.name = 'CPS LLC';
    acc.AnnualRevenue = 333000.00;
    acc.Type = 'Prospect';
    acc.AccountSource = 'Advertisement';
    accList.add(acc);

    insert accList;

    AccConAndOppOperations.fetchAllAccounts();
    AccConAndOppOperations.fetchAccountsForAType('Prospect');
    AccConAndOppOperations.fetchOpportunities('Closed Won');
    AccConAndOppOperations.fetchOpportunities('Closed Won', 'Web');
    AccConAndOppOperations.fetchSumOfAllOppsAmount();

    List<Account> accL = [
      SELECT name, type, annualrevenue, accountsource
      FROM Account
    ];
    String type1 = accL[0].Type;

    System.assertEquals('Prospect', type1);
  }

  @isTest
  public static void createAccountTest() {
    AccConAndOppOperations.createAccount('CPS Llc', 300000, 'Prospect');

    List<Account> accL = [SELECT id, name, annualrevenue, type FROM Account];

    System.assertEquals('Prospect', accL[0].Type);
  }

  @isTest
  public static void createContact() {
    account acc = new account();
    acc.name = 'new acc';
    insert acc;

    Contact con = AccConAndOppOperations.createContact(acc.Id);
    test.startTest();
    System.assertEquals('new acc', con.Name);
    test.stopTest();
  }

  @isTest
  public static void updateTop100pps() {
    List<Opportunity> opp = new List<Opportunity>();
    Opportunity o = new Opportunity();
    o.name = 'LLC';
    o.StageName = 'Closed Won';
    o.CloseDate = Date.newInstance(2022, 4, 18);
    o.Description = '';
    opp.add(o);
    insert opp;

    AccConAndOppOperations.updateTop10Opps();
  }

  @isTest
  public static void createOppsTest() {
    Account acc = new Account();
    acc.Name = 'some name';
    acc.AnnualRevenue = 300000;
    insert acc;

    // List<Opportunity> opp = AccConAndOppOperations.createNOpps(0, acc.id);

    List<Opportunity> opp = AccConAndOppOperations.createNOpps(3, acc.id);

    Test.startTest();
    System.assertEquals(3, opp.size());
    System.assertEquals('Prospecting', opp[0].StageName);
    Test.stopTest();
  }

  @isTest
  static void deleteClosedLostOppsTest() {
    Opportunity opp = new Opportunity();
    opp.Name = 'some opps';
    opp.Amount = 16000;
    opp.StageName = 'Closed Lost';
    opp.CloseDate = Date.today();
    insert opp;

    AccConAndOppOperations.deleteClosedLostOpps();

    List<opportunity> oppsList = [
      SELECT Name
      FROM Opportunity
      WHERE Amount < 20000 AND StageName = 'Closed Lost'
    ];

    //System.assertEquals(1, oppsList.size());
    System.assertEquals(0, oppsList.size());
  }

  @isTest
  public static void printOppAndAccDetailsTest() {
    Account acc = new Account();
    acc.name = 'some account';
    acc.AnnualRevenue = 20000;
    acc.Type = 'Customer - Direct';
    Opportunity opp = new Opportunity(
      name = 'some opp',
      Amount = 300000,
      StageName = 'Closed Won'
    );
    opp.AccountId = acc.Id;
    insert acc;

    AccConAndOppOperations.printOppAndAccDetails();

    System.assertEquals('some opp', acc.name);
  }

  @isTest
  public static void createContactsForAccountsTest() {
    Account acc = new Account();
    acc.name = 'some account';
    Contact c = new Contact();
    c.accountId = null;
    insert acc;

    AccConAndOppOperations.createContactsForAccounts();

    list<contact> conList = [SELECT id, lastname FROM Contact];

    test.startTest();
    System.assertEquals(1, conlist.size());
    test.stopTest();
  }

  @isTest
  private static void accountsWithAtLeastOneContactTest() {
    List<Contact> conL = new List<Contact>{
      new Contact(lastname = 'some contact'),
      new Contact(lastname = 'one contact')
    };

    insert conL;

    Account acc = new Account();
    acc.Name = 'some account';
    insert acc;

    List<Account> retAcc = AccConAndOppOperations.accountsWithAtLeastOneContact();

    List<Account> tstAcc = [SELECT id, name FROM Account];

    test.startTest();
    System.assertEquals(1, tstAcc.size());
    System.assertEquals('some account', tstAcc[0].name);
    System.debug(tstAcc[0].name);
    test.stopTest();
  }

  @isTest
  public static void accountsWithAtLeastOneContact1Test() {
    Account acc = new Account();
    acc.name = 'some account';
    insert acc;

    Contact c = new Contact();
    c.LastName = 'someone';
    c.AccountId = acc.id;
    insert c;

    List<Account> accL = AccConAndOppOperations.accountsWithAtLeastOneContact1();

    test.startTest();
    System.assertEquals(1, accL.size());
    test.stopTest();
  }

  @isTest
  public static void accountsWithAtLeastOneOppTest() {
    Account acc = new Account();
    acc.Name = 'some account';
    insert acc;

    // Opportunity opp = new Opportunity();
    // opp.Name = 'some opp';
    // opp.CloseDate = Date.newInstance(2022, 04, 18);
    // opp.StageName = oppstageName;
    // opp.AccountId = acc.Id;
    // insert opp;

    List<Account> accL = AccConAndOppOperations.accountsWithAtLeastOneOpp(
      'Closed Won'
    );

    List<Account> aL = [SELECT Id FROM account];

    test.startTest();
    System.assertEquals(1, aL.size());
    test.stopTest();
  }

  @isTest
  public static void deleteOrphanContacts() {
    Contact con = new Contact();
    con.LastName = 'some contact';
    con.AccountId = null;
    insert con;

    AccConAndOppOperations.deleteOrphanContacts();

    List<Contact> cL = [SELECT accountId FROM contact];

    test.startTest();
    System.assertEquals(1, cl.size());
    test.stopTest();
  }
}
