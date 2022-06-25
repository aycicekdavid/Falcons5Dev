List<Account> newAcc = [
      SELECT Id, Name, Description, CreatedDate
      FROM Account
      WHERE CreatedDate = TODAY
    ];

List <Account> upd = AccountManage.updateRecords(newAcc);

update upd;