@RestResource(urlMapping='/fetchAccountsAndChilds')
//outer class
global class AccountsAndChildData {
  @HttpGet
  global static List<Account> fetchAllAccounts() {
    RestRequest reqInstance = RestContext.request; //fetching the url. Endpoint URL.

    Map<String, String> paramMap = reqInstance.params;

    String accountType = paramMap.get('type');

    //Dynamic SOQL
    String query = 'SELECT id, name, phone, type, (SELECT id, name FROM Opportunities), (SELECT id, firstName, lastName, email FROM contacts) FROM Account';

    if (accountType != null) {
      query += ' WHERE type = :accountType';
    }

    return Database.query(query);
  }

  /*
    Create Account, Contact and Opportunity with API 
    Business Use Case: Create Account, Opportunity and Contact through API with Session_ID(access token) and Opportunity and Contact should be linked to the created Account and each id should be returned to the customer.
    Challenges: Account and its related child data should be send to the API  in single callout.
    Request should be parsed & inner Classes should be used to parse the request.
    Solution: Create an Apex Class Explore as a Web Service   - Create a @httppost Method to insert account and child records  - Use Inner class to serialize the request and to send the response  - Create Connect App, Get the Access Token and fetch the same data from Postman.
  */
  @HttpPost
  global static void createAccountAndChild() {
    RestRequest reqInstance = RestContext.request;
    String jsonString = reqInstance.requestBody.toString(); //Every request body comes in JSON format, so we need to convert/serialize it to String format.

    AccountAndChildWrapper wrapperInstance = (AccountAndChildWrapper) (JSON.deserialize(
      jsonString,AccountAndChildWrapper.class)); //Request body in String format.

    if (wrapperInstance != null && wrapperInstance.account != null) {
      Account accInstance = new Account(
        Name = wrapperInstance.account.name,
        Type = wrapperInstance.account.type,
        Phone = wrapperInstance.account.phone
      );

      insert accInstance;

      if (wrapperInstance.contact != null) {
        Contact conInstance = new Contact(
          AccountId = accInstance.id,
          FirstName = wrapperInstance.contact.firstName,
          LastName = wrapperInstance.Contact.lastName,
          Email = wrapperInstance.contact.email
        );

        insert conInstance;
      }

      if (wrapperInstance.opportunity != null) {
        Opportunity oppInstance = new Opportunity(
          AccountId = accInstance.id,
          Name = wrapperInstance.Opportunity.name,
          StageName = wrapperInstance.Opportunity.stageName,
          CloseDate = wrapperInstance.Opportunity.closeDate
        );

        insert oppInstance;
      }
    }
  }

  //Wrapper class/inner class (Class in class)
  public class AccountAndChildWrapper {
    public AccountWrapper account;
    public ContactWrapper contact;
    public OpportunityWrapper opportunity;
  }

  public class AccountWrapper {
    public String name;
    public String type;
    public String phone;
  }

  public class OpportunityWrapper {
    public String name;
    public String stageName;
    public Date closeDate;
  }

  public class ContactWrapper {
    public String firstName;
    public String lastName;
    public String email;
  }
}
