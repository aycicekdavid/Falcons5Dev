public with sharing class AccountController {
    
    //get top 10 accounts based on annual revenue
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){

     return [SELECT Id, Name, Type, Industry, AnnualRevenue from Account WHERE AnnualRevenue != null ORDER BY AnnualRevenue DESC LIMIT 10];

    }

    //get all the accounts whose type matches with the given type
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByType(String type){
 
     return [SELECT Name, Type, Industry, AnnualRevenue from Account WHERE type LIKE :type LIMIT 10];
    }

    //IMPERATIVE: get all the accounts whose name contains the given search key
    @AuraEnabled
    public static List<Account> searchAccounts(String searchKey) {

        searchKey = '%' + searchKey + '%';//%est%

        return [SELECT Id, Name, Type, Industry, AnnualRevenue, AccountNumber from Account WHERE Name LIKE :searchKey with SECURITY_ENFORCED];
    }
  

}
