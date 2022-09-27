// ==== Updating (Opportunity) Record Types ====

Utilities.updateRecordTypesInAnSObject();

// ==== Updating (Account) Record Types ====
Utilities.updateRecordTypesInAccount();

// ==== Delete Unwanted Account Records ====
List<Account> delAcc = [select id from account where name like '%Account2%'];
delete delAcc;
