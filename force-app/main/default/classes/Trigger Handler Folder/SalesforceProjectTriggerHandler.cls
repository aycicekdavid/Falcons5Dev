public with sharing class SalesforceProjectTriggerHandler {


  public static void spCompleteStatus(list<Salesforce_Project__c> spTriggerNew, list<Salesforce_Project__c> spTriggerOld, map<id, Salesforce_Project__c> spTriggerNewMap, map<id, Salesforce_Project__c> spTriggerOldMap) {

    set<id> spIds = new Set<id>();

    for (Salesforce_Project__c spRecord : spTriggerNew) {
      
      if (spRecord.status__c == 'Completed' && spTriggerOldMap.get(spRecord.id).status__c != 'Complete') {

        spIds.add(spRecord.id);
      }
    }
    System.debug('SpIds ' + spIds);

    if(!spIds.isEmpty()){
      updateTicketStatusCompleted(spIds);
    }
  }

  @future
  public static void updateTicketStatusCompleted(Set<id> spIds) {
      
    List<Salesforce_ticket__c> listST = [SELECT id, status__c, salesforce_project_SP__c FROM Salesforce_ticket__c
    WHERE salesforce_project_SP__c IN :spIds AND status__c != 'Completed'];

    System.debug('Tickets ' + listST);

    for (salesforce_ticket__c stRecord : listST) {

      stRecord.status__c = 'Completed';
    }
    update listST;
  }

  //====================================================
  @future
  public static void updateProjectDescription(set<id> setSpId) {
    //we have ids, so fetch project records to update description

    List<salesforce_project__c> lstSP = [SELECT id, description__c FROM Salesforce_project__c WHERE id IN :setSpId];

    system.debug('project records ' + lstSP);

    for (Salesforce_project__c eachSP : lstSP) {
      eachSP.description__c += '. Update from Future!!';
    }

    update lstSP;
  }
  //====================================================

  //AFTER EVENT EXAMPLE: When create a parent, automatically create child record.

  //When we create new Salesforce Project (parent object), then create new 'default' Salesforce Ticket (child object) automatically.

  public static void createDefaultSFTicketAutomatically(
    List<Salesforce_Project__c> newTrigger
  ) {
    List<Salesforce_Ticket__c> newList = new List<Salesforce_Ticket__c>();

    for (Salesforce_Project__c sfP : newTrigger) {
      Salesforce_Ticket__c sfT = new Salesforce_Ticket__c();
      sfT.Subject__c = 'Default ST';
      sfT.Salesforce_Project_SP__c = sfP.id;
      newList.add(sfT);
    }
    if (newList.size() > 0)
      insert newList;
  }
  //====================================================
}
