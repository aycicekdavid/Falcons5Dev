public class ContactTriggerHandler {

  //Roll-up the count of Contacts on NumOfContacts field on Account objcet
  public static void rollUpOnAccountInsertUpdateUndelete(List<Contact> newTrigger){
    
    Set<Id> accIds = new Set<Id>();

    for(Contact con : newTrigger){
      if(con.AccountId != null){
        accIds.add(con.AccountId);
      }
    }

    List<Account> accList = [SELECT Id, Number_of_Contact__c, (SELECT id FROM Contacts) FROM Account WHERE Id IN:accIds];

    for(Account acc : accList){
      acc.Number_of_Contact__c = acc.Contacts.size();
    }

    if(accList.size() > 0){
      update accList;
    }
  } 

  public static void rollUpOnAccountDelete(List<Contact> oldTrigger){

    Set<Id> accIds = new Set<Id>();

    for(Contact con : oldTrigger){
      if(con.AccountId != null){
        accIds.add(con.AccountId);
      }
    }

    List<Account> accList = [SELECT Id, Number_of_Contact__c, (SELECT id FROM Contacts) FROM Account WHERE Id IN:accIds];

    for(Account acc : accList){
      acc.Number_of_Contact__c = acc.Contacts.size();
    }

    if(accList.size() > 0){
      update accList;
    }
  }
  //================================================================
  //If a user try to delete a contact which has no account, it should get error message.

  public static void contactWithoutAccountDeletion(List<Contact> oldTrigger) {
    for (Contact con : oldTrigger) {
      if (con.AccountId == null) {
        con.addError('You can not delete a contact without an account');
      }
    }
  }
  //================================================================
  // Create a checkbox field on account called “Need Info”
  // create a checkbox field on contact called "passive"
  // if %50 or more of contact related to the account are passive, mark "need info" ceckbox true.

  public static void PassiveInfo(list<Contact> cont) {
    Map<Id, List<Contact>> accContactMap = new Map<Id, List<Contact>>();

    List<Account> accUpdateList = new List<Account>();

    for (Contact con : [
      SELECT accountId, Passive__c
      FROM Contact
      WHERE accountId != NULL
    ]) {
      List<Contact> contLists;
      if (accContactMap.containsKey(con.accountId)) {
        contLists = accContactMap.get(con.accountId);
      } else {
        contLists = new List<Contact>();
      }

      contLists.add(con);
      accContactMap.put(con.accountId, contLists);
    }

    for (Id accId : accContactMap.keySet()) {
      Integer count_of_Passive = 0;

      Integer total_con = accContactMap.get(accId).size();

      if (accContactMap.get(accId).size() > 1) {
        for (integer i = 0; i < accContactMap.get(accId).size(); i++) {
          if (accContactMap.get(accId)[i].Passive__c == true) {
            count_of_Passive++;
          }
        }
      }
      if (((count_of_Passive * 100) / total_con) >= 50)
        accUpdateList.add(new Account(id = accId, Need_Info__c = true));
    }
    if (!accUpdateList.isEmpty()) {
      update accUpdateList;
    }
  }
  //================================================================
  //When a new contact is created for an existing account then set contact other phone as account phone

  public static void otherPhoneAsAccountPhone(List<Contact> newTrig) {
    Set<Id> accSetIds = new Set<Id>();
    for (contact con : newTrig) {
      if (con.AccountId != null) {
        accSetIds.add(con.AccountId);
      }
    }

    if (accSetIds.size() > 0) {
      map<id, Account> mapAcc = new Map<id, Account>(
        [SELECT id, phone FROM Account WHERE Id IN :accSetIds]
      );
      for (Contact con : newTrig) {
        if (con.AccountId != null && mapAcc.containsKey(con.AccountId)) {
          if (mapAcc.get(con.AccountId).Phone != null) {
            con.OtherPhone = mapAcc.get(con.AccountId).Phone;
          }
        }
      }
    }
  }
  //================================================================
  // Create  “Contact Relationship” field which is checkbox on the Contact Object and
  // Create the related object called “Contact Relationship” which is a related list to the Contacts.(Look Up Relationship).
  // Write a trigger for ,
  // - when we create contact by checking the Contact Relationship checkbox,
  // - then Contact Relationship will be created automatically for that contact.

  /*
    1-Create  “Contact Relationship” field which is checkbox on the Contact Object
    2-Create the related object called “Contact Relationship” which is a related list to the Contacts.(Look Up Relationship). 
    3-Create a list from Trigger.new >> parameter
    4-Create a Record_Relationship List which will store newly created relationships
    5-Create a for loop to iterate Contacts from the parameter which is newly created contacts
    6-Since we are going to insert new contact into Contact_Relationship object, create a new object
    7-Assign the relationship field to the lastname of the contact. Assign relationship id to contact id to add parent records to create a related record.
    8-Test when we create contact by checking the Contact Relationship checkbox, then Contact Relationship will be created automatically for that contact.
    7-Test for negative case
   */

  public static void checkChecbox(List<Contact> newListOfCnt) {
    List<Contact_Relationship__c> crList = new List<Contact_Relationship__c>();

    for (Contact cnt : newListOfCnt) {
      if (cnt.Contact_Relationship__c) {
        Contact_Relationship__c cr = new Contact_Relationship__c();
        cr.Contact__c = cnt.Id;
        cr.Name = cnt.LastName;
        crList.add(cr);
      }
    }

    if (crList.size() > 0) {
      insert crList;
    }
  }

  //================================================================
  //ASSIGNEMENT GIVEN BY JIMMY
  // Create one trigger on Contact object and that should be executed on update.
  // I want you to print the contact records which were updated along with the old value and new value both.
  // Along with the same, I want to make sure and show that to users with the help of debug that the lastname of the contact is same or not among the old and new records for the updated records.

  public static void contactUpdate(
    List<Contact> accTriggerNew,
    List<Contact> accTriggerOld,
    Map<Id, Contact> accTriggerNewMap,
    Map<Id, Contact> accTriggerOldMap
  ) {
    //Iterate the new contact list from the given Contact List

    for (Contact eachCon : accTriggerNew) {
      //Since Id is unique and same for new and old Contact Map values, we can get the Id via using eachCon variable with get method to retrieve the old lastname from Contact Map.

      String oldLastName = accTriggerOldMap.get(eachCon.Id).LastName;
      String newLastName = eachCon.LastName;

      if (oldLastName != newLastName) {
        System.debug(
          'The old last name is changed. Old lastname is : ' +
          oldLastName +
          ' New Lastname : ' +
          newLastName
        );
      } else {
        System.debug('The old and the new lastname is same; no any change.');
      }
    }
  }
  //================================================================

  //BEFORE EVENT EXAMPLES : VALIDATION. If we validate an object, we use before event.

  //If Contact's Lead Source is 'Partner Referral' then don't allow user to Update the contact.

  public static void contactUpdateValidation1(List<Contact> triggerNew) {
    //Using custom label in a method.
    string customError = System.label.contactvalidation2;

    for (Contact con : triggerNew) {
      if (con.LeadSource == 'Partner Referral') {
        con.addError(customError);
      }
    }
  }
  //===================================================================

  //If Contact's Lead Source is 'Partner Referral' then don't allow user to Update Lead Source field for any contact.

  public static void contactUpdateValidation2(List<Contact> newTrigger, Map<Id, Contact> mapOld) {
    for (Contact con : newTrigger) {
      if (con.LeadSource != mapOld.get(con.Id).LeadSource) {
        con.LeadSource.addError('Cannot update. Go away.');
      }
    }
  }
  //===================================================================
  //Rollup Summary for lookup field. Account object as parent and Contact object as child Number_of_Contact__c should be updated to Count of all related Conatct records. When contact are inserted/updated/deleted/undeleted.
  //Which object? --> contact
  //which event? --> after

  public static void rollUpSummaryForLookUpField(List<Contact> triggerNew,List<Contact> triggerOld,Map<Id, Contact> oldMap,Map<Id, Contact> newMap) {

    Set<Id> accountIds = new Set<Id>();

    for (Contact con : triggerNew) {
      if (con.AccountId != null) {
        accountIds.add(con.AccountId);
      }
    }

    for (Contact con : triggerOld) {
      if (con.AccountId != null) {
        accountIds.add(con.AccountId);
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
}