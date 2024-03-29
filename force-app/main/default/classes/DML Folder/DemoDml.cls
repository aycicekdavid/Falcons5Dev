public class DemoDml {
  // Create one class called demoDmlClass
  // which will have the constructor to show the welcome / greeting message and
  // have one method called dmlInsert
  // that will accept keychar in parameter and

  // check if we have any records available with the given keychar.
  // If yes, we will create the contact related to the same, we will take the name of the account and we will use the same name in contact name followed by 'copied from account' to create the contact record.

  // Example
  // --------------------------------------------
  // Welcome to the world of SOQL. Please enter the key character to search.

  // Input ::
  // es
  // Output ::

  // 0035j00000KAFJIAA5 | Sean Forbes
  // 0035j00000KAFJIBAY | James Carry

  // Contacts we will create with following names:
  // Sean Forbes copied from account
  // James Carry copied from account

  public DemoDml() {
    System.debug(
      'Welcome to the world of SOQL. Please enter the key character to search.'
    );
  }

  public static void dmlInsert(String keychar) {
    List<Contact> accountWithCont = [
      SELECT Name, id, AccountId
      FROM Contact
      WHERE Name LIKE :'%' + keychar + '%'
    ];

    System.debug(accountWithCont);

    List<Contact> listCont = new List<Contact>();

    if (!accountWithCont.isEmpty()) {
      for (contact acc : accountWithCont) {
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = acc.LastName + ' copied from account.';

        System.debug('Contact name is : ' + con.LastName);
        listCont.add(con);
      }
    }
    System.debug(listCont);
    //   insert listCont;
  }
}
