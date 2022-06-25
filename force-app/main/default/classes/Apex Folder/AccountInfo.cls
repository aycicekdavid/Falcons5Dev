public class AccountInfo {
  // - Create one class related to the same, name of the class will be AccountInfo.
  // - That AccountInfo will have the map to store the Account holder's information.
  // - We can pass the map of the Account holders in which we will have information about few account holders.
  // - Our non-parameterized constructor will say that, 'Hello, Please enter the account number!'.
  // - We will be creating one non-static method which will just accept the accountNumber, and it will show the information about the account holders if the accountNumber which is passed as parameter exists in the map.

  public Map<String, AccountHolderInfo> mapOfAccount = new Map<String, AccountHolderInfo>();

  public AccountInfo(Map<String, AccountHolderInfo> mapOfAccount) {
    System.debug('Hello. Please enter the account number!');
    this.mapOfAccount = mapOfAccount;
  }

  public void showAccountInfo(String accountNumber) {
    if (!mapOfAccount.containsKey(accountNumber)) {
      System.debug('No such an account!');
    } else {
      System.debug(this.mapOfAccount.get(accountNumber));
    }
  }

  // HINT: Map will be like following
  //         Map<String, AccountHolderInfo> mapOfAccount = new Map<String, AccountHolderInfo>();

  // EXAMPLE
  // ------------------------------------
  // Input:
  // Name  | accountNumber | phone     | email
  // --------------------------------------------------
  // 'Jimmy', '123123123123123', '9898989898', 'jimmy@mail.com'
  // 'James', '321321321321321', '7878787878', 'james@mail.com'
  // 'Karl', '456456456456456', '7676767676', 'karl@mail.com'

  // Hello, Please enter the account number!
  // 321321321321321
  // Hello James, welcome to the Bank! Your phone number = 7878787878 and email address = james@mail.com.

  // Hello, Please enter the account number!
  // 456456456456456
  // Hello Karl, welcome to the Bank! Your phone number = 7676767676 and email address = karl@mail.com.
}
