List<Account> accList = [select id, name from account];
AccountQueueableExample aqe = new AccountQueueableExample(accList);
ID jobID = System.enqueueJob(aqe);
System.debug('jobID ' + jobID);

//The code below is for removing the --SI name extension for Account objects.
// for(account acc : accList){
//     acc.name = acc.name.substring(0,acc.name.length()-4);
// }
// update accList;