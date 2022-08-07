public class AccountInfoSqol {
  // Create one class AccountInfo and
  // have one method who iterates
  // - over the list of accounts whose
  // - Name contains the 'A' inside the Name and
  // - that account does have accountNumber (which means Account number is not null).
  // Iterate those list of accounts with the help of system.debug.

  public static void findAccountsA() {

    List<Account> accountWithA = [
      SELECT Name,AccountNumber, Phone
      FROM Account
      WHERE Name LIKE '%A%'
      AND AccountNumber != NULL
    ];

    Integer count = 1;
    for (Account eachAcc : accountWithA) {

      String name = eachAcc.name;
      String acc = eachAcc.AccountNumber;
      String phone = eachAcc.Phone;
      
      System.debug(count + '.  Account name = ' + name + ', Account # = ' + acc + ',  Account phone # = ' + phone); 

      count++;
    }
  }

  // Example Output:
  // Account Name is James. Account Number is 0000001. Account Phone number is 9898989898.
  // Account Name is Karl. Account Number is 0000002. Account Phone number is 7878787878.
  // Account Name is Arla. Account Number is 0000003. Account Phone number is 9090909090.
}