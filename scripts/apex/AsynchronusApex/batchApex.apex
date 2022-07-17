//anonymous file
//create a new instance of batch class
AccountBatch ab = new AccountBatch();

//execute batch with default batchSize(200)
//Id batchId = Database.executeBatch(ab);

//another way is to pass batchSize second parameter. 10 is chunk (group of 10 records) number. Default is 200, max is 10,000.
Id batchId2 = Database.executeBatch(ab, 10);

// List<Account> accn = [select id, description from account];
// List<account> ac = new list<account>();
// for(account a : accn){

//     a.Description = '';
//     ac.add(a);
// }
// update ac;

