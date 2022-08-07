@RestResource(urlMapping='/fetchallaccounts')
global class AccountRESTController {

    @HttpGet
    global static List<Account> gueryAllAccounts() { 
        
        //Complete URL 
          // domain = ''
          // url = ''
          //param = ''
        RestRequest reqInstance = RestContext.request;

        Map<String, String> paramMap = reqInstance.params;

        return [select id, name, phone, type from account where Type = 'Customer - Direct' limit 5];
    }

}