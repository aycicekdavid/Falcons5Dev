@RestResource(urlMapping='/fetchallaccounts')
global class AccountRESTController {

  @HttpGet
  global static List<Account> queryAllAccounts() { 
      
    //Complete URL
      // url = https://cozy-dev-ed.my.salesforce.com/services/apexrest/fetchallaccounts?type=Prospect
      // domain = https://cozy-dev-ed.my.salesforce.com/
      //path = /services/apexrest/fetchallaccounts
      //search/params = type=Prospect
    RestRequest reqInstance = RestContext.request; //This Class (RestRequest) is fetching the url and its pieces below the url. Endpoint URL.

    Map<String, String> paramMap = reqInstance.params;
    String type = paramMap.get('type');
    String name = paramMap.get('name');
    
    return [select id, name, phone, type from account where type = :type and name =:name];
      
  }


  @HttpPost
  global static void createAccount() {

    RestRequest reqInstance = RestContext.request; 
    String jsonString = reqInstance.requestBody.toString();//Converting the body to the json string.

    //We are getting our params from inner/wrapper class and we're converting them to JSON format with deserializing. JSON  is a class and it has a method called deserialize(). 
    //Instead of putting params in createAccount() method, we're getting them from inner class. Then we are converting them to JSON format as mentioned above.
    //Type casting JSON String to Wrapper Instance
    AccountWrapper wrapperInstance = (AccountWrapper)(JSON.deserialize(jsonString, AccountWrapper.class));
    
    Account accountInstance = new Account(
      Name = wrapperInstance.accountName,
      Type = wrapperInstance.accountType,
      Description = wrapperInstance.accountDescription
    );

    insert accountInstance;   
  }

  //This is inner class/wrapper class. This is kind of an sObject.
  public class AccountWrapper {

    public String accountName;
    public String accountType;
    public String accountDescription;
  }

}