// cat sf = new Cat();
// sf.color = 'white1';
// sf.name = 'alex1';
// System.debug('sf cat is ' + sf);

// Cat falconsCat = new Cat('white2', 'alex2');
// System.debug('falcons cat ' + falconsCat);
// ListDemo.allCats();

List<Account> ls = [select id,name from Account where name like '%Cozy%'];

List<Account> del = new List<Account>();

for(Account acc : ls){
    del.add(acc);
}

delete del;




Contact con = new Contact();
con.FirstName = 'Martin';
con.LastName = 'Luther';
insert con;



Account acc = new Account();
acc.name = 'Some Account LLC';
acc.active__c = 'Yes';
insert acc;



List<Account> accnt = new List<Account>();
Integer sizeOfList = 0;
for(Integer i = 0; i < 401; i++){
    Account acc = new Account();
    acc.name = 'Group Test LLC ' + i;
    // acc.Website = 'www.somewebsite.com';
    // acc.active__c = 'Yes';
    // acc.Description = 'Something.';
    accnt.add(acc);
}
insert accnt;

List<Account> acc = [select name, website from Account where name like '%Group%'];
List<Account> a = new List<Account>();

for(Account each : acc){
    each.Name = 'The Cozy Inc';
    each.Website = 'www.cozyinc.com';
    each.active__c = 'Yes';
    a.add(each);
}
update a;

//========================CASE===========================

List<Case> ls = [select id,ContactId from Case where status like '%Working%'];

List<Case> del = new List<Case>();

for(Case cas : ls){
    del.add(cas);
}
delete del;


List<Case> lstCase = new List<Case>();

for(Integer i = 0; i < 205; i++){
    Case cas = new Case();
    cas.ContactId = '0038c00002fR6mAAAS';
    cas.Status = 'New';
    lstCase.add(cas);
 
}
insert lstCase;

list<case> updateCases = [select id, subject, status from case where status = 'New'];
for(case eachCase : updateCases){
    eachCase.Status = 'Working';
}
update updateCases;


