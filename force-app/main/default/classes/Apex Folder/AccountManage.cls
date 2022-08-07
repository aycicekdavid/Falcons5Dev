public class AccountManage {
  // Create an apex class AccountManage that
  // - updates the Description field for the newly created records with AccountHandlerInfo class.
  // - Let's make sure to use the values passed in name for account while updating the Description field.
  // New value of the Description should be the combination of the Name of the account and created date of the account.

  // For an example,
  //   - the name of the account is <<Jimmy Thakkar>> and
  //   - the record has been created on <<2022-02-12T10:53:35.000+0000>> than
  //   - the Description of the record will be ==> Jimmy Thakkar2022-02-12T10:53:35.000+0000

  public static List<Account> updateRecords(List<Account> accountHandler) {
      
    List<Account> newAccList = new List<Account>();

    for (Account eachAcc : accountHandler) {

      Account newAcc = new Account();
      newAcc.id = eachAcc.Id;
      newAcc.Description = eachAcc.Name + ' ' + eachAcc.CreatedDate;
      newAccList.add(newAcc);
      System.debug(eachAcc.Name + ' ' + eachAcc.CreatedDate);
    }
    
    return newAccList;
  }
}