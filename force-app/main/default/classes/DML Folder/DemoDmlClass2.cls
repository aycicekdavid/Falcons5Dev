public class DemoDmlClass2 {
    public static void dmlInsert(Integer num) {
        //Create one class called the DMLDemoClass2 and 
        //which will have the method called dmlInsert to accept the number in parameter, once someone gives the number it should create that many records for account object. 
        List<Account> accList = new List<Account>();
        Account acc = new Account();

        for(Integer i = 1; i <= num; i++){
            acc.Name = 'Account'+1;
            acc.Phone = '234456432'+i;
            acc.AccountNumber = 'AC3742834'+i;
            accList.add(acc);
        }
        System.debug(accList);
        insert accList;
        //We will have dmlUpdate method which will have one parameter as string, once someone gives any string in parameter, 
        //we will update those records which we recently created by including given string inside the name. 
        //We will have dmlDelete method which will delete all the records we created today itself.

        // Example
        // -----------------------------
        // dmlInsert => 5
        // Account1
        // Account2
        // Account3
        // Account4
        // Account5
        // dmlUpdate => alpha
        // Account1 alpha
        // Account2 alpha
        // Account3 alpha
        // Account4 alpha
        // Account5 alpha
        // dmlDelete
        // Delete all 5 records
        
    }
}