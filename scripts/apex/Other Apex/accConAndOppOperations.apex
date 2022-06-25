List<Account> allAccounts = new List<Account>();
//AccConAndOppOperations.allAcc(allAccounts);
List<Account> accType = AccConAndOppOperations.accType('Customer - Direct');
System.debug(accType);
