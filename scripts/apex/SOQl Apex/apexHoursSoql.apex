//Having word
//SELECT StageName, count(ID)
//FROM Opportunity
//WHERE closeDate = LAST_YEAR
//GROUP BY StageName
//HAVING Count(ID)>1

//Child to Parent relationship query
//SELECT FirstName, LastName, Account.Name
//FROM Contact
//WHERE Account.Name LIKE 'U%'

//SELECT Name, Account.Name, Account.Type
//FROM Opportunity

//Parent to Child relationship query
//SELECT Name,
//    (SELECT Id, Name, CloseDate FROM Opportunities)
//FROM Account WHERE Name = 'dickenson plc'

//Query via Apex
// List<Opportunity> lstOpp = [select Id, Name FROM Opportunity];
// System.debug(lstOpp.size());

//Child to Parent Query via Apex
// List<Opportunity> childToParentQuery = [
// SELECT Name, Account.Name, Account.Type
// FROM Opportunity
// WHERE Account.Name Like 'Edge%'];
// System.debug(childToParentQuery);

// for(Opportunity opp : childToParentQuery){
//     System.debug('Opportunity Name: ' + opp.Name);
//     System.debug('Parent Account Name: ' + opp.Account.Name);
// }

//Parent to Child Query via Apex
// List<Account> prntToChildQuery = [
//   SELECT Name, Id, (SELECT Name, Id FROM Opportunities)
//   FROM Account
// ];

// for (Account accOpp : prntToChildQuery) {

//   System.debug('Account name: ' + accOpp.Name);

//   for(Opportunity opp : accOpp.Opportunities){

//       System.debug('Opportunity name: ' + accOpp.Id);
//   }
  
// }

//SOSL 


