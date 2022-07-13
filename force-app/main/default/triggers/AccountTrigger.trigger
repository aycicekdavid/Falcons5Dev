trigger AccountTrigger on Account(before insert, before update, after update, after insert) {
  //========================================================================
  // if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
  //   AccountTriggerHandler.createOppIfAccNoOpp(Trigger.new);
  // }
  //========================================================================
  // if(Trigger.isBefore && Trigger.isUpdate){
  //   AccountTriggerHandler.totalAmountofRelatedOpp(Trigger.new);
  // }
  //========================================================================
  // if(Trigger.isAfter && Trigger.isInsert){
  //   AccountTriggerHandler.sendEmailToAdmin(Trigger.new);
  // }
  //========================================================================
  // if(Trigger.isUpdate && Trigger.isAfter){
  //   AccountTriggerHandler.oppStageUpdate(Trigger.new,Trigger.old);
  // }
  //========================================================================
  // if(Trigger.isBefore && Trigger.isInsert){
  //   AccountTriggerHandler.changeShippingAddress(Trigger.new);
  // }
  //========================================================================
  // if(Trigger.isBefore && Trigger.isUpdate){
  //   AccountTriggerHandler.checPostalCodArea(Trigger.new, Trigger.oldMap);
  // }
  //========================================================================
  // if((Trigger.isInsert || Trigger.isUpdate) && Trigger.isAfter){
  //   AccountTriggerHandler.createNumOfContactsWithAccLocationNum(Trigger.new);
  // }
  //========================================================================
  // if (Trigger.isBefore && Trigger.isUpdate) {
  //  AccountTriggerHandler.sendEmailToRelatedContacts(Trigger.new, Trigger.oldMap);
  // }
  //========================================================================
  // if (Trigger.isInsert && Trigger.isAfter) {
  //   AccountTriggerHandler.accountWithIndustry(Trigger.new);
  // }
  //========================================================================
  // if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
  //   AccountTriggerHandler.accountAddressTrigger(Trigger.new);
  // }
  //========================================================================
  // if(Trigger.isBefore && Trigger.isUpdate){
  //   AccountTriggerHandler.updateAssociatedContact(Trigger.new);
  // }
  //========================================================================
  // if(Trigger.isBefore && Trigger.isUpdate){
  //   AccountTriggerHandler.smallGroupAcc(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
  // }
  //========================================================================
  // if(Trigger.isAfter && Trigger.isUpdate){
  //  AccountTriggerHandler.updateAccOppStage(Trigger.new);
  // }
  //========================================================================
  // if(Trigger.isBefore && Trigger.isUpdate){
  //   AccountTriggerHandler.smallGroupAcc(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
  // }
  //========================================================================
  if (trigger.isBefore) {
    system.debug('before insert/update trigger on account object');
    AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
  }
  //========================================================================
   if(Trigger.isAfter && Trigger.isUpdate) {
     //call updateVIPforAllContacts method.
     AccountTriggerHandler.updateVIPForAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

  //AFTER EVENT TRIGGER EXAMPLE

  // if(Trigger.isAfter && Trigger.isUpdate){
  //   AccountTriggerHandler.updateVIPForAllCon(Trigger.new);
  // }
  //========================================================================
  //BEFORE EVENT TRIGGER EXAMPLE
  // if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)){
  //   AccountTriggerHandler.whenActivePicklistUpdated(Trigger.new);
  // }
  //========================================================================
  //Count thr number of records, where 'WebDite' field is updated in Account. And print the following statement. - For Account 'Vitap', new WEBSITE is 'vitap.com'. We want to print a statement only when  record is UPDATED. And that too only when one FIELD is updated.

  // if (trigger.isAfter && trigger.isUpdate) {

  //   for (Id eachAccId : trigger.newMap.keyset()) {

  //     Map<id, account> accOldMap = trigger.OldMap;
  //     Account oldAccount = accOldMap.get(eachAccId);
  //     string oldWebsite = oldAccount.Website;

  //     Map<id, account> accNewMap = trigger.NewMap;
  //     Account newAccount = accNewMap.get(eachAccId);
  //     string newWebsite = newAccount.Website;

  //     if(oldWebsite != newWebsite){
  //         system.debug('For Account ' + newAccount.Name + ', new Website is ' + newWebsite);
  //     }
  //   }
  // }

  //Count the number of records, where 'WebSite' field is updated in Account. And print the following statement. - For Account 'Vitap', new WEBSITE is 'vitap.com'. We want to print a statement only when  record is UPDATED. And that too only when one FIELD is updated.

  //which event should I use?

  // if(Trigger.isAfter && Trigger.isUpdate){

  //   Map<Id,Account> newMp = Trigger.newMap;
  //   Map<Id,Account> oldMp = Trigger.oldMap;

  //   Integer counter = 0;

  //   for(id accId : newMp.keySet()){

  //     String accName = newMp.get(accId).Name;
  //     String newWebSite = newMp.get(accId).Website;
  //     String oldWebSite = oldMp.get(accId).Website;

  //     if(newWebsite != oldWebSite){
  //       counter++;
  //       System.debug('For account ' + accName + ', the new website is ' + newWebSite + '.');
  //     }
  //   }
  //   System.debug('Total updated account number is ' + counter);
  // }

  //========================================================================
  //MAP TASK

  // if (Trigger.isAfter && Trigger.isUpdate) {
  //   System.debug('After Update trigger of Aaccount object.');

  //   Map<id, Account> accNewMap = Trigger.newMap;
  //   Map<id, Account> accOldMap = Trigger.oldMap;

  //   for(Id eachId : accNewMap.keySet()){
  //     System.debug('acc id = ' + eachId);

  //     Account newAcc = accNewMap.get(eachId);
  //     System.debug('new acc name = ' + newAcc.Name);

  //     Account oldAcc = accOldMap.get(eachId);
  //     System.debug('old acc name = ' + oldAcc.Name);
  //   }
  // }
  //=======================================================================
  //TRIGGER CONTEXT VARIABLES : MAPs

  // Map<id, Account> trgNewMap = trigger.newMap;
  // Map<id, Account> trgOldMap = trigger.oldMap;

  // if (Trigger.isBefore && Trigger.isInsert) {
  //   System.debug('======Before insert==========');
  //   System.debug('Before insert OLD MAP ' + trgOldMap);
  //   System.debug('Before insert NEW MAP ' + trgNewMap);
  // }

  // if (Trigger.isAfter && Trigger.isInsert) {
  //   System.debug('======After insert==========');
  //   System.debug('After insert OLD MAP ' + trgOldMap);
  //   System.debug('After insert NEW MAP ' + trgNewMap);
  // }
  // if (Trigger.isBefore && Trigger.isUpdate) {
  //   System.debug('======Before Update==========');
  //   System.debug('Before Update OLD MAP ' + trgOldMap);
  //   System.debug('Before Update NEW MAP ' + trgNewMap);
  // }

  // if (Trigger.isAfter && Trigger.isUpdate) {
  //   System.debug('======After Update==========');
  //   System.debug('After Update OLD MAP ' + trgOldMap);
  //   System.debug('After Update NEW MAP ' + trgNewMap);
  // }

  // if(Trigger.isBefore && Trigger.isUpdate){

  //   Map<Id,Account> mapAccOld = Trigger.oldMap;
  //   Map<Id,Account> mapAccNew = Trigger.newMap;

  //   for(id accId : mapAccOld.keySet()){

  //     Account acc = new Account();
  //     acc.id = accId;
  //     String oldAccName = mapAccOld.get(acc.id).Name;
  //     String newAccName = mapAccNew.get(acc.id).Name;
  //     System.debug('Original Account name : ' + oldAccName);
  //     System.debug('New Account name : ' + newAccName);
  //   }

  //======================================================================
  // OLD AND NEW COMPARISION TASK

  // if(trigger.isAfter){

  //   if(trigger.isUpdate){

  //     for(Account oldAcc : trigger.old){
  //       System.debug('Old acc id = ' + oldAcc.id + ' , Old accName = ' + oldAcc.Name);
  //     }

  //     for(Account newAcc : trigger.new){
  //       System.debug('New acc id = ' + newAcc.id + ' , New accName = ' + newAcc.Name);
  //     }
  //   }
  // }
  //======================================================================
  //OLD KEYWORD

  // if (Trigger.isBefore && Trigger.isInsert) {
  //   System.debug('Trigger.old before Insert ' + trigger.old);
  // }

  // if (Trigger.isAfter && Trigger.isInsert) {
  //   System.debug('Trigger.old after Insert =' + trigger.old);
  // }
  // if (Trigger.isBefore && Trigger.isUpdate) {
  //   System.debug('Trigger.old before Update =' + trigger.old);
  //   System.debug('Trigger.new before Update =' + trigger.new);
  // }

  // if (Trigger.isAfter && Trigger.isUpdate) {
  //   System.debug('Trigger.old after Update =' + trigger.old);
  //   System.debug('Trigger.new after Update =' + trigger.new);
  // }
  //======================================================================
  //NEW KEYWORD
  /*
  List<Account> newAccounts = Trigger.new;

  if (Trigger.isBefore && Trigger.isInsert) {
    System.debug('trigger.new before insert.new = ' + Trigger.new);
  }

  if (Trigger.isAfter && Trigger.isInsert) {
    System.debug('trigger.new after insert.new = ' + Trigger.new);
  }

  List<Account> newAccounts = Trigger.new;
  if (Trigger.isBefore && Trigger.isUpdate) {
    System.debug('trigger.new before update.new = ' + Trigger.new);
    for (Account eachAcc : newAccounts) {
      System.debug('before update lastModified Date : ' + eachAcc.LastModifiedDate);
    }
  }
  */

  /*
  if (Trigger.isAfter && Trigger.isUpdate) {
    System.debug('trigger.new after update.new = ' + Trigger.new);
    for (Account eachAcc : newAccounts) {
        System.debug('after update lastMidified Date : ' + eachAcc.LastModifiedDate);
      }
  }
  */
  //========================================================================

  // if(trigger.isAfter && trigger.isInsert){
  //   List<Account> newAccounts;
  //   System.debug('trigger.new in isAfter = ' + trigger.new);
  //   System.debug('trigger.new in isAfter = ' + newAccounts);

  //   newAccounts = trigger.new;

  //   System.debug('size of newAccount = ' + newAccounts.size());

  //   for(Account acc : newAccounts){
  //       System.debug('account id : ' + acc.id + 'account name :' + acc.Name);
  //   }
  // }

  //See the difference between isBefore && isInsert and isAfter && isInsert
  // if(Trigger.isBefore && Trigger.isInsert){
  //   System.debug('trigger.new before insert = ' + trigger.new);
  // }
  // if(Trigger.isAfter && Trigger.isInsert){
  //   System.debug('trigger.new after insert = ' + trigger.new);
  // }

  //See the difference between isBefore && isUpdate and isAfter && isUpdate

  // if(Trigger.isBefore && Trigger.isUpdate){
  //   //System.debug('trigger.new before update = ' + trigger.new);
  //   for(account acc : Trigger.new){
  //     System.debug('Before - Account Id : ' + acc.Id + ', Before - Last Modified Date&Time : ' + acc.LastModifiedDate);
  //   }
  // }
  // Date s = System.today();
  // if(Trigger.isAfter && Trigger.isUpdate){
  //   //System.debug('trigger.new after update = ' + trigger.new);
  //   for(account acc : Trigger.new){
  //     System.debug('After - Account Id : ' + acc.Id + ', After - Last Modified Date&Time : ' + acc.LastModifiedDate);
  //   }
  // }
  //========================================================================
  //TRIGGER INSERT - TRIGGER UPDATE KEYWORDS

  // if (Trigger.isBefore && Trigger.isInsert) {
  //   System.debug('Before insert trigger called. yeah');
  // }

  // if (Trigger.isAfter && Trigger.isInsert) {
  //   System.debug('After insert trigger called. yeah yeah.');
  // }

  // if (Trigger.isBefore && Trigger.isUpdate) {
  //   System.debug('Before update trigger called.');
  // }

  // if (Trigger.isAfter && Trigger.isUpdate) {
  //   System.debug('After update trigger called.');
  // }

  //========================================================================
  //TRIGGER BEFORE AND AFTER KEYWORDS

  // if(Trigger.isBefore){
  //   System.debug('Before trigger is called.');
  // }
  // if(Trigger.isAfter){
  //   System.debug('After trigger is called.');
  // }
  //========================================================================

  // if(Trigger.isBefore){

  //   if(Trigger.isUpdate){
  //     System.debug('Before and update is called.');
  //   }
  //   if(Trigger.isInsert){
  //     System.debug('Before and insert is called.');
  //   }
  // }else if(Trigger.isAfter){

  //   if(Trigger.isUpdate){
  //     System.debug('After and update is called.');
  //   }
  //   if(Trigger.isInsert){
  //     System.debug('After and insert is called.');
  //   }
  // }
}
