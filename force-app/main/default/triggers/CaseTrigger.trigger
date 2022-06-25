trigger CaseTrigger on Case(
  before insert,
  after insert,
  before update,
  after update
) {
  if (Trigger.isInsert) {
    system.debug('before insert case trigger');
  }

  if (Trigger.isUpdate) {
    Integer count = 0;
    count++;
    System.debug('count = ' + count);
    CaseTriggerHandler.countTriggerExecution++;
    system.debug('actual count : ' + CaseTriggerHandler.countTriggerExecution);

    // CaseTriggerHandler.countRecordsUpdated += Trigger.size;
    // System.debug('# of records updated : ' + CaseTriggerHandler.countRecordsUpdated);
  }

  //ASSIGNMENT PART 1

  // 1. Create a trigger on Case object named as “CaseTrigger”. Show the debug messages as follows:
  // Triggers - "We are in the triggers"
  // after triggers - "We are in the after triggers"
  // before triggers - "We are in the before triggers"
  // before Update - "We are in the before-Update triggers" before Insert - "We are in the before-Insert triggers" after update - "We are in the after-Update triggers" after Insert - "We are in the after-Insert triggers".

  // System.debug('a--> We are in the triggers');
  // if (Trigger.isAfter) {
  //   System.debug('b--> We are in the after trigger');
  // }
  // if (Trigger.isBefore) {
  //   System.debug('c--> We are in the before trigger');
  // }
  // if (Trigger.isBefore && Trigger.isUpdate) {
  //   System.debug('d--> We are in the before--update trigger');
  // }
  // if (Trigger.isBefore && Trigger.isInsert) {
  //   System.debug('e--> We are in the before--insert trigger');
  // }
  // if (Trigger.isAfter && Trigger.isUpdate) {
  //   System.debug('f--> We are in the after--update trigger');
  // }
  // if (Trigger.isAfter && Trigger.isInsert) {
  //   System.debug('g--> We are in the after--insert trigger');
  // }

  //ASSIGNMENT PART 2
  // 2. Try to print this message (Case# [caseNumber] was created with id [recordId] on [createdDate].) in all the events where Id is not null.

  // For example: when a case with Id as ‘5005j00000C7CRJAA3’ and with case number as ‘11234’ created on 12/7/2021. then the message should be printed as –
  // Case# 11234 was created with id 5005j00000C7CRJAA3 on 12/7/2021.

  // if (Trigger.isAfter && Trigger.isInsert) {
  //   for (Case cDateIdCaseNo : Trigger.new) {
  //     System.debug('Case ID after insert' + cDateIdCaseNo.id + 'Case#' + cDateIdCaseNo.CaseNumber + 'on ' + cDateIdCaseNo.createdDate);
  //   }
  // }

  // if (Trigger.isBefore && Trigger.isUpdate) {
  //   for (Case cDateIdCaseNo : Trigger.new) {
  //     System.debug('Case ID after update' + cDateIdCaseNo.id + 'Case#' + cDateIdCaseNo.CaseNumber + 'on ' + cDateIdCaseNo.createdDate);
  //   }
  // }

  // if (Trigger.isAfter && Trigger.isUpdate) {
  //   for (Case cDateIdCaseNo : Trigger.new) {
  //     System.debug('Case ID after update' + cDateIdCaseNo.id + 'Case#' + cDateIdCaseNo.CaseNumber + 'on ' + cDateIdCaseNo.createdDate);
  //   }
  // }

}
