trigger ContactTrigger on Contact(before insert,after insert,before update,after update,before delete,after delete,
  after undelete) {
  //==================================================================================
  // if (Trigger.isBefore && Trigger.isDelete){
  //   ContactTriggerHandler.contactWithoutAccountDeletion(Trigger.old);
  // }
  //==================================================================================
  // if (Trigger.isAfter && Trigger.isUpdate){
  //   ContactTriggerHandler.PassiveInfo(Trigger.new);
  // }
  //==================================================================================
  // if (Trigger.isBefore && Trigger.isInsert){
  //   ContactTriggerHandler.otherPhoneAsAccountPhone(Trigger.new);
  //  }
  //==================================================================================
  // if (Trigger.isAfter && Trigger.isInsert) {
  //    ContactTriggerHandler.checkChecbox(Trigger.new);
  // }
  // ==================================================================================
  // if(Trigger.isAfter && Trigger.isUpdate){
  //    ContactTriggerHandler.contactUpdate(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
  // }
  //==================================================================================
  //   if(Trigger.isBefore && Trigger.isUpdate){
  //   ContactTriggerHandler.contactUpdateValidation1(Trigger.new);
  // }
  //==================================================================================
    if(Trigger.isBefore && Trigger.isUpdate){
      ContactTriggerHandler.contactUpdateValidation1(Trigger.new);
      ContactTriggerHandler.contactUpdateValidation2(Trigger.new, Trigger.oldMap);
  }
  //==================================================================================
  //   if (trigger.isInsert)
  //   System.debug('Before contact insert trigger called.');

  //   if (trigger.isUpdate)
  //   System.debug('Before contact update trigger called');
  //==================================================================================
  // if(Trigger.isBefore && Trigger.isUpdate){
  //   System.debug('before contact update trigger called');
  // }
  // if(Trigger.isBefore && Trigger.isInsert){
  //   System.debug('before contact insert trigger called');
  // }
  // if(Trigger.isAfter && Trigger.isUpdate){
  //   System.debug('after contact update trigger called');
  // }
  // if(Trigger.isAfter && Trigger.isInsert){
  //   System.debug('after contact insert trigger called');
  // }
  //==================================================================================

  // if(Trigger.isBefore){
  //   if(Trigger.isInsert){
  //     System.debug('before and insert');
  //   }
  //   if(Trigger.isUpdate){
  //     System.debug('before and update');
  //   }

  // }
  // if(Trigger.isAfter){

  //   if(Trigger.isInsert){
  //     System.debug('after and insert');
  //   }
  //   if(Trigger.isUpdate){
  //     System.debug('after and update');
  //   }
  // }
  //==================================================================================

  Set<Id> accountIds = new Set<Id>();

  if (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) {
    for (Contact con : Trigger.new) {
      if (con.AccountId != null) {
        accountIds.add(con.AccountId);
      }
    }
  }

  if (Trigger.isUpdate || Trigger.isDelete) {
    for (Contact con : Trigger.old) {
      if (con.AccountId != null) {
        accountIds.add(con.AccountId);
      }
    }
  }

  if (!accountIds.isEmpty()) {
    List<Account> accList = [
      SELECT id, Number_of_contact__c, (SELECT id FROM contacts)
      FROM Account
      WHERE id IN :accountIds
    ];

    if (!accList.isEmpty()) {
      List<Account> updateAccList = new List<Account>();

      for (Account acc : accList) {
        Account objAcc = new Account();
        objAcc.id = acc.Id;
        objAcc.Number_of_Contact__c = acc.contacts.size();
        updateAccList.add(objAcc);
      }

      if (!updateAccList.isEmpty()) {
        update updateAccList;
      }
    }
  }
}