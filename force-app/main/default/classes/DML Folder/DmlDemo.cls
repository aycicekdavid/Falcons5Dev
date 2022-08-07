public class DmlDemo {
  public static void dmlInserDemo_stndObject() {
    Account acc = new Account();
    acc.Name = 'SoftInnovas';

    insert acc;
    System.debug(acc);
  }

  public static void dmlRpdateDemo_1() {
    Account acc = new Account();
    acc.Name = 'SoftInnovas2';
    System.debug('Pending insert ' + acc);

    insert acc;
    System.debug('insert: ' + acc);

    acc.Name = 'Salesforce Inc.3336';
    update acc;
    System.debug('Update: ' + acc);
  }

  public static void dmlUpdateDemo_2() {
    Account acc = [SELECT id, name FROM account    WHERE name = 'SoftInnovas Inc.' LIMIT 1
    ];

    Contact cnt = new Contact();

    cnt.FirstName = 'Joe';
    cnt.LastName = 'Biden';
    cnt.Email = cnt.FirstName + '@' + cnt.LastName + '.com';

    cnt.AccountId = acc.Id;

    insert cnt;
    System.debug('acc = ' + acc);
  }

  public static void dmlUpdateDemo_3() {
    Account acc = [SELECT id, name FROM account
      WHERE name = 'SoftInnovas2' LIMIT 1];

    System.debug('fetch acc ' + acc);

    acc.Name = 'SoftInnovas Inc.ZZZ';

    update acc;
    System.debug('acc = ' + acc);
  }

  public static void dmlMultipleRecordInsert_right1() {
    List<Account> listAcc = new List<Account>();

    Account acc1 = new Account();
    acc1.name = 'Green Group LLC';
    listAcc.add(acc1);

    Account acc2 = new Account();
    acc2.name = 'Yellow Group LLC';
    listAcc.add(acc2);

    Account acc3 = new Account();
    acc3.name = 'Blue Group LLC';
    listAcc.add(acc3);

    insert listAcc;
  }

  public static void dmlUpdateDemo_2_co() {
    salesforce_project__c sp = [SELECT id FROM salesforce_project__c ORDER BY createdDate DESC  LIMIT 1];

    salesforce_ticket__c st = new salesforce_ticket__c();
    st.Subject__c = 'learn apex';
    st.priority__c = 'High';
    st.status__c = 'New';

    st.Salesforce_Project_SP__c = sp.id;

    insert st;

    system.debug('salesforce ticket: ' + st);
  }

  public static void dmlMultipleRecordInsert_right2() {
    list<account> listAccount = new List<account>();

    account acc = new account();
    acc.Name = 'SoftInnovas 28 Feb v0';
    acc.accountNumber = 'acbx-1';
    acc.Active__c = 'Yes';
    system.debug('before saving acc = ' + acc);
    listAccount.add(acc);

    for (Integer i = 1; i < 150; i++) {
      account acc2 = new account();
      acc2.Name = 'SoftInnovas 28 Feb v' + i;
      acc2.accountNumber = 'acbx-1' + i;
      acc2.Active__c = 'Yes';
      listAccount.add(acc2);
    }
    system.debug('size of list ' + listAccount.size());
    if (!listAccount.isEmpty()) {
      insert listAccount;
    }
  }

  public static void dmlMultipleRecordUpdate_right() {
    List<Account> listAcc = [SELECT id, name FROM Account WHERE CreatedDate = TODAY ];

    List<Account> updateAccounts = new List<Account>();

    for (Account acc : listAcc) {
      acc.Name = acc.Name + 'via B.0';
      updateAccounts.add(acc);
    }

    if (!updateAccounts.isEmpty()) {
      update updateAccounts;
    }
  }

  public static void deleteAcc() {
    List<Account> listAcc = [SELECT id, name FROM Account WHERE CreatedDate = TODAY];

    delete listAcc;

    // delete [SELECT id, name FROM Account WHERE CreatedDate = TODAY];
  }
}