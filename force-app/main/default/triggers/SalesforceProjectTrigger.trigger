trigger SalesforceProjectTrigger on Salesforce_project__c(
  before insert,
  after insert,
  after update
) {
  //   //call future method
  //   set<id> setids = Trigger.newMap.keySet();
  //   system.debug('sp ids ' + setids);
  //   SalesforceProjectTriggerHandler.updateProjectDescription(setids);
  // }

  //===========================================================================
  if (Trigger.isBefore && Trigger.isupdate) {
    SalesforceProjectTriggerHandler.spCompleteStatus(
      Trigger.new,
      Trigger.old,
      Trigger.newMap,
      Trigger.oldMap
    );
  }
  //===========================================================================
  //When we create new Salesforce Project, then create new 'default' Salesforce Ticket automatically.
  // if(Trigger.isAfter && Trigger.isInsert){
  //   SalesforceProjectTriggerHandler.createDefaultSFTicketAutomatically(Trigger.new);
  // }
}
