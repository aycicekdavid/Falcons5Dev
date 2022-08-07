trigger SalesforceProjectTrigger on Salesforce_project__c(before insert, before update, after insert, after update) {
 
  // if(Trigger.isAfter && Trigger.isInsert){ 
  //   //call future method
  //   SalesforceProjectTriggerHandler.updateProjectDescription(Trigger.newMap.keySet());
  //   Set<Id> setId = Trigger.newMap.keySet();
  //   System.debug('Sp Ids ' + setId);
  // }

  // if(Trigger.isAfter && Trigger.isUpdate){
  //   SalesforceProjectTriggerHandler.spCompleteStatus(Trigger.new,Trigger.old, Trigger.oldMap, Trigger.newMap);
  // }

  //====================================================
  // if (Trigger.isBefore && Trigger.isupdate) {
  //   SalesforceProjectTriggerHandler.spCompleteStatus(
  //     Trigger.new,
  //     Trigger.old,
  //     Trigger.newMap,
  //     Trigger.oldMap
  //   );
  // }
  //====================================================
  //When we create new Salesforce Project, then create new 'default' Salesforce Ticket automatically.
  if(Trigger.isAfter && Trigger.isInsert){
    SalesforceProjectTriggerHandler.createDefaultSFTicketAutomatically(Trigger.new);
  }
}