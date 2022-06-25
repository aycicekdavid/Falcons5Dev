//DmlDemo.dmlInserDemo_stndObject();
//DmlDemo.dmlInserDemo_cstmObject();
// DmlDemo.dmlRpdateDemo_1();
//DmlDemo.dmlUpdateDemo_3();
//DmlDemo.dmlUpdateDemo_2();
//DmlDemo.dmlMultipleRecordInsert_right1();
//DmlDemo.dmlUpdateDemo_2_co();
//DmlDemo.dmlMultipleRecordInsert_right2();
//DmlDemo.dmlMultipleRecordUpdate_right();
  Account newAcc = new Account();
  newAcc.name = 'Blue Lmtd Sti.';

  insert newAcc;

  newAcc.AccountNumber = 'Ac# 23334';

  Account newAcc2 = new Account();
  newAcc2.name = 'Moon Star Lmtd Sti.';

  List<Account> accList = new List<Account>{newAcc,newAcc2};

  upsert accList;



