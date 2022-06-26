public class SoqlDemo {
  public static void accountSOQL_1() {
    //SOQL query always return us the List<sObject>
    List<account> listAcc = [SELECT id, Name FROM Account];
    System.debug('Account list = ' + listAcc);
    System.debug('Number of records ' + listAcc.size());

    //Since we retreiving one account, we don't need to create list.
    Account acc = [SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 1];
    System.debug('Latest account created is ' + acc);
  }

  public static void accountSOQL_2() {
    Account acc = [SELECT Id, Name, Phone, accountNumber FROM Account ORDER BY createdDate DESC
                   LIMIT 1];

    System.debug('Latest account created is ' + acc);

    String accPhone = acc.Phone;
    String accName = acc.Name;
    String accountNumber = acc.AccountNumber;

    System.debug('acc name is ' + accName + '  phone is ' + accPhone + '  acc id ' +
      accountNumber);
  }

  public static void accountSOQL_3() {
    //SOQL can return only sObject if it is returning ONLY 1 RECORD

    List<Account> listAcc = [SELECT Id, Name, Phone, accountNumber FROM Account];

    for (Account eachAccount : listAcc) {
      String accPhone = eachAccount.Phone;
      String accName = eachAccount.Name;
      String accNum = eachAccount.AccountNumber;

      System.debug('acc name is ' + accName + '  phone is ' + accPhone);
      System.debug('acc number is ' + eachAccount.AccountNumber);
    }
  }

  public static void accountSOQL_Filter(String accNameFilter) {
    List<Account> listAcc = [SELECT id, name FROM Account WHERE Name = :accNameFilter];

    System.debug(listAcc);
  }

  public static void myReviewMethod() {
    Account accList = [SELECT id, name, phone, accountNumber FROM Account ORDER BY CreatedDate DESC LIMIT 1];

    String accName = accList.name;
    String accPhone = accList.phone;
    String accAccountNumber = accList.accountNumber;
    String accId = 'Acc id is = ' + accList.id;

    System.debug('Acc name is : ' + accName + ', Acc phone is : ' + accPhone + ', Acc number is : ' +     accAccountNumber + ' , ' + accId);
    System.debug(accList);
  }

  public static void myReviewMethod2() {
    List<Account> accList = [SELECT id, name, phone, accountNumber FROM Account WHERE Phone != NULL ORDER BY CreatedDate DESC];

    Integer counter = 1;

    for (Account eachAccount : accList) {
      String accName = eachAccount.name;
      String accPhone = eachAccount.phone;
      String accAccountNumber = eachAccount.accountNumber;
      String accId = ' Acc id is = ' + eachAccount.id;

      System.debug(counter + '. Acc name is : ' + accName + ', Acc phone is : ' + accPhone + ', Acc number is : ' +
        accAccountNumber + accId);
      counter++;
    }
  }

  public static void myReviewMethod3Filter() {
    String accNameFilter = 'Salesforce Inc.';
    List<Account> listAcc = [SELECT id, name FROM Account WHERE name = :accNameFilter];
    System.debug(listAcc);
  }

  public static void myReviewMethod4Filter(String accNameFilter) {
    List<Account> listAcc = [SELECT id, name FROM Account WHERE name = :accNameFilter];
    System.debug(listAcc);
  }
}
