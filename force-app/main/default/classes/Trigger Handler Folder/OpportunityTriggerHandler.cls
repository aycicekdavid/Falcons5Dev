public class OpportunityTriggerHandler {

//Create a new field "Points" on Opportunnity Object. Update the Points fields whenever a new opp is created or stahe name field is updated. Store the given (Prospecting --> 1, etc.) points value and Stage name mapping in custom setting so that in future if the points value changes for a particular stage name or a new stage name is introduced, we need not to change the apex code.

public static void updateOpportunityPoints(List<Opportunity> oppTriggerNew, Map<Id, Opportunity> oppTriggerOldMap){

  //This map comes from custom settings
  Map<String,OppStageNamePoints__c> oppPointsCS = OppStageNamePoints__c.getAll();
  System.debug(oppPointsCs);
  //key is stageName here
  //value is custom setting record

  for(Opportunity opp : oppTriggerNew){

    boolean updatePoints = false;

    //if oldMap is null then insert
    if(oppTriggerOldMap == null){
      updatePoints = true;

      //if oldMap value is not equal to the new value then insert.
    }else {
      if(oppTriggerOldMap.get(opp.id).StageName != opp.stageName){
      updatePoints = true;
      }
    }

    if(updatePoints){
      OppStageNamePoints__c cp = oppPointsCS.get(opp.stageName);
      opp.points__c = cp.points__c; //this should come from custom settings.
    }
  }
}




  //================================================================

  // A SF Company plans to launch a product in different region (ASIA, EMEA, NA, SA) across the world. They also want to sell the products to their clients which are in ASIA,EMEA, NA and SA .
  // -Create a Multi picklist name In Account Object “Working in”
  // Asia, Emea , Na, Sa
  // *Write a script to get the total Quantity of Products sold in only Accounts Working in = Emea.
  // *Write a Trigger to stop creating or updating Opportunities with Account having “Working in = Emea” and Already 2 Closed Won Opportunity under same Account.

  public static void getTotalProductQty(List<Opportunity> triggerNew) {
    List<Account> accList = [SELECT id, name,(SELECT id, stageName, TotalOpportunityQuantity FROM Opportunities       WHERE stageName = 'Closed Won') FROM Account WHERE Working_in__c = 'EMEA'];

    for (opportunity opp : triggerNew) {
      for (Account acc : accList) {
        if (acc.id == opp.AccountId && acc.Opportunities.size() > 1) {
          system.debug(acc.Opportunities.size());
          opp.addError('More than two Closed Won is not allowed.');
        }
      }
    }
  }

  //================================================================

  //Add Multi-select Picklist field on Account and Opportunity as well. Add values A,B,C,D.
  //Now when we update Opportunity with this multi-select values, Account should also be updated with the same picklist values.

  public static void multiPicklistUpdate(
    List<Opportunity> triggerNew,
    Map<Id, Opportunity> triggerOldMap
  ) {
    Set<Id> accId = new Set<Id>();
    Map<Id, String> ABCDMap = new Map<Id, String>();

    for (Opportunity opp : triggerNew) {
      if (opp.ABCD__c != triggerOldMap.get(opp.id).ABCD__c) {
        if (opp.AccountId != null) {
          ABCDMap.put(opp.AccountId, opp.ABCD__c);
          accId.add(opp.AccountId);
        }
      }
    }

    List<Account> accUpdateList = new List<Account>();
    List<Account> accList = [SELECT Id, ABCD__c FROM Account WHERE Id = :accId];

    if (accList.size() > 0) {
      for (Account acc : accList) {
        if (ABCDMap.containsKey(acc.Id)) {
          String str = ABCDMap.get(acc.Id);
          acc.ABCD__c = str;
          accUpdateList.add(acc);
        }
      }
    }

    if (accUpdateList.size() > 0) {
      update accUpdateList;
    }
  }

  //================================================================

  // Create a Task record
  // Whenever an opportunity is updated to closed/won and Amount is more than 10000.
  // Populate Task record fields in the following manner:
  // - Subject = "Opportunity Closed", WhatId = Opportunity recordId, OwnerId = Opportunity OwnerId, and Type = 'Call'.

  public static void ifOppClosedWonCreateTask(List<Opportunity> updatedOpp) {
    List<Task> taskList = new List<Task>();

    for (Opportunity opp : updatedOpp) {
      if (opp.StageName == 'Closed Won' && opp.Amount > 10000) {
        Task t = new Task(
          Subject = 'Opportunity Closed',
          WhatId = opp.Id,
          OwnerId = opp.OwnerId,
          Status = 'New'
        );
        taskList.add(t);
      }
    }

    if (taskList.size() > 0) {
      insert taskList;
    }
  }

  //================================================================

  // Create a Task record Whenever an opportunity is
  //-updated to closed/won and Amount is more than 10000.
  // Populate Task record fields in the following manner:
  // Subject = "Opportunity Closed", WhatId = Opportunity recordId, OwnerId = Opportunity OwnerId, Status = 'New' and Type = 'Call'.

  public static void createTaskOpp(
    List<Opportunity> oppTriggerNew,
    Map<Id, Opportunity> oppTriggerOldMap
  ) {
    List<Task> taskList = new List<Task>();

    for (Opportunity eachOpp : oppTriggerNew) {
      if (
        eachOpp.StageName != oppTriggerOldMap.get(eachOpp.id).StageName &&
        eachOpp.StageName == 'Closed Won' &&
        eachOpp.Amount > 10000
      ) {
        Task tsk = new Task();
        tsk.WhatId = eachOpp.Id;
        tsk.Subject = 'Opportunity Closed';
        tsk.OwnerId = eachOpp.OwnerId;
        tsk.Status = 'New';
        tsk.Type = 'Call';
        taskList.add(tsk);
      }
    }
    insert taskList;
  }

  //================================================================

  // Create one trigger on Opportunity object and that should be executed on UPDATE.
  // I want you to print the opportunity records which were updated along with the OLD value and NEW value both.
  // Along with the same, I want to make sure and show that to users with the help of debug that HOW MANY RECORDS NAMES HAVE BEEN CHANGED.

  public static void opportunityUpdate(
    List<Opportunity> oppTriggerNew,
    List<Opportunity> oppTriggerOld,
    Map<Id, Opportunity> oppTriggerNewMap,
    Map<Id, Opportunity> oppTriggerOldMap
  ) {
    Integer counter = 0;

    for (Opportunity eachOpp : oppTriggerNew) {
      String oldName = oppTriggerOldMap.get(eachOpp.Id).Name;
      String newName = eachOpp.Name;

      System.debug('Old name is :' + oldName + ' New name is :' + newName);

      if (oldName != newName) {
        counter++;
      }
    }
    System.debug('The changed Name number is : ' + counter);
  }

  //================================================================

  // When an opportunity is created show a debug message ([OpportunityName] – [CloseDate] – [Amount]) for each opportunity and
  //print the total number of opportunities created in the transaction.
  //For example: Demo Opportunity – 20/10/2022 – 40000.

  public static void debugMessage(List<Opportunity> numOfOpps) {
    for (Opportunity opp : numOfOpps) {
      System.debug('Opportunity name: ' + opp.Name +' - ' +'Close Date: ' + opp.CloseDate +' - ' +'Amount: ' +opp.Amount);
    }
  }

  //================================================================

  // Print the Old and New Amount field values in one line. Old and New Close Date field values in another line for opportunity when opportunities are updated.
  //When the StageName of an opportunity is updated, then print the value of description field and opportunity name.

  public static void oldAndNewAmountInOnLine(
    Map<Id, Opportunity> triggerOldMap,
    List<Opportunity> triggerNew
  ) {
    for (Opportunity opp : triggerNew) {
      Opportunity oldValue = triggerOldMap.get(opp.Id);

      System.debug('Old Amount: ' + oldValue.Amount + ' New Amount: ' + opp.Amount);

      if (oldValue.CloseDate != opp.CloseDate) {
        System.debug('Old Date: ' + oldValue.CloseDate +'New Date: ' + opp.CloseDate);
      }

      if (oldValue.StageName != opp.StageName) {
        System.debug('Description: ' + opp.Description +' Opportunity Name: ' + opp.Name);
      }
    }
  }

}