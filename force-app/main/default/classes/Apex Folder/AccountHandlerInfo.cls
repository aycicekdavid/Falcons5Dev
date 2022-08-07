public class AccountHandlerInfo {
  //The Apex class must be called AccountHandlerInfo and be in the public scope
  //Create an Apex class that inserts new accounts named after an incoming parameter as list of string.
  //If the accounts are successfully inserted, the method should return the List of account records.
  //The Apex class must have a public static method called insertNewAccount
  //The method must accept an incoming List of string as a parameter, which will be used to create the Account names
  //If a parameter is blank than we should show the error message from class and the method should return null.
  //The list of accounts will be created based on the list of string, that means if we are passing the list of 5 strings than 5 account records will be created
  //The method must insert the accounts into the system and then return the records

  public static List<Account> insertNewAccount(List<String> lstStr) {
    List<Account> accList = new List<Account>();

    if (lstStr.isEmpty()) {

      System.debug('Error message');
      accList = null;

    } else {

      for (String str : lstStr) { 
        Account acL = new Account();
        acL.name = str;
        accList.add(acL);
      }
    }
    System.debug(accList);
    return accList;
  }
}