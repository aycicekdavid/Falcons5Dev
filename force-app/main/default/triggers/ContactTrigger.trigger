trigger ContactTrigger on Contact(before insert,after insert,before update,after update,before delete,after delete,after undelete) {

  //Roll-up on Account

  if(Trigger.isAfter){

    if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
      ContactTriggerHandler.rollUpOnAccountInsertUpdateUndelete(Trigger.new);
    }
    if(Trigger.isDelete){
      ContactTriggerHandler.rollUpOnAccountDelete(Trigger.old);
    }
  }
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
    // if(Trigger.isBefore && Trigger.isUpdate){
    //   ContactTriggerHandler.contactUpdateValidation1(Trigger.new);
    //   ContactTriggerHandler.contactUpdateValidation2(Trigger.new, Trigger.oldMap);
    // }
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
}