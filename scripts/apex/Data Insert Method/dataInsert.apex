//Create accounts
Account acc1 = new Account();
acc1.name = 'SI Test';
acc1.Industry = 'Energy';
acc1.active__c = 'No';

Account acc2 = new Account();
acc2.name = 'UI Test';
acc2.Industry = 'Energy';
acc2.active__c = 'Yes';

//required fields missing
Account acc12x = new Account();
Account acc12y = new Account();

List<Account> listAcc = new List<Account>{acc1, acc2, acc12x, acc12y};

List<Database.SaveResult> results = Database.insert(listAcc, false);

//iterate SaveResult array
for(Database.SaveResult sr : results){
    if(sr.isSuccess()){
        //successfully inserted
        //handle insertion
        System.debug('Account successfully inserted, Account Id is: ' + sr.getId());
    }else{
        //Error encountered
        System.debug('Errors :' + sr.getErrors());
    }
}