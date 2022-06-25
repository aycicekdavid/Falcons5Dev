public class AccountTriggerHandler {
  //Write a trigger that creates opportunity record if the account doesn't contain at least one opportunity

  public static void createOppIfAccNoOpp(List<Account> newTrigger) {
    List<Opportunity> oppList = new List<Opportunity>();

    //get the related opp
    List<Account> listAcc = [
      SELECT id, Name, (SELECT Name, id FROM Opportunities)
      FROM Account
      WHERE Id IN :Trigger.new
    ];
    for (Account acc : listAcc) {
      if (acc.Opportunities.size() == 0) {
        Opportunity opp = new Opportunity();
        opp.AccountId = acc.id;
        opp.Name = acc.Name + ' Opportunity';
        opp.CloseDate = System.today().addMonths(1);
        opp.StageName = 'Prospecting';
        oppList.add(opp);
      }
    }
    if (oppList.size() > 0) {
      insert oppList;
    }
  }
  //========================================================================
  // Create a field on Account Named (Client Contact lookup to Contact). Once an Account is inserted a Contact will create with the name of the Account and that Contact will be the Client Contact on the Account.
  // Here we are using “after insert” because here the condition is first we should insert contact and then a related contact with the same name as account name, so to get the Account Id to make its related contact first the Account has to be inserted then only we will be able to get the Account Id. So we have to use ” after insert”.

  // We are looping the Accounts which are getting inserted and then also creating a Contact that has the same name as the Account and we are making it related to that particular Account only. Immediately after this, we are inserting those Contacts. Then we are getting the records of the inserted Account to put it into the Map<Id,Account> where Id contains Account Id and Account contains that particular Id’s records. After this, we are looping the inserted Contact and checking if the Contact’s Account Id is present in the Map. If present we are getting that particular Account’s record and given the Contact Id value to the field “Client Contact” of Account. Then we are adding it to a separate list to update it later. And finally, we are updating the Accounts for which the changes have been done.

  //========================================================================
  // Once an Account will update then that Account will update with the total amount from All its Opportunities on the Account Level. The account field name would be ” Total Opportunity Amount “.

  // EXPLANATION: The first thing we have to see is which trigger to use ” before ” or ” after “,  here we have to update the Account itself again so we cannot use the ” after ” trigger because once the Accounts are updated the fields of the Account becomes ” read-only ” i.e, we will not be able to do changes to the Account data. So if we use ” before update ” then we will be able to make changes to the Account fields later it will get updated by default. This is the reason we are using ” before update “.
  //In the below code first, we are getting the list of Account Id’s  to get its related Opportunities. We have created a Map<Id,Double> where Id contains the Account Id and Double contains the sum of Amount of a particular Account’s related Opportunities so that it will be easy for us to insert the sum of amount according to the Account Id’s. Then we are getting the “Aggregate Result” i.e, we use this when we use sum or average in a query. We are putting all the data of the Aggregate Result to the Map which we have written before. Later we are looping the Accounts which are getting updated and check if that Account Id is there in Map, if it is there then we are changing the value of the ” Total Amount Opportunity ” field in Account.

  public static void totalAmountofRelatedOpp(List<Account> newTrigger) {
    Set<id> accId = new Set<id>();

    for (Account acc : newTrigger) {
      acc.Total_Opportunity_Amount__c = 0;
      accId.add(acc.Id);
    }

    Map<id, Double> amountMap = new Map<id, double>();
    List<AggregateResult> results = [
      SELECT accountId, sum(Amount) TotalAmount
      FROM Opportunity
      WHERE AccountId IN :accId
      GROUP BY AccountId
    ];

    if (results.size() > 0) {
      for (AggregateResult a : results) {
        Id accountId = (Id) a.get('AccountId');
        Double TotalAmount = (Double) a.get('TotalAmount');
        amountMap.put(accountId, TotalAmount);
      }
    }

    for (Account acc : newTrigger) {
      if (amountMap.containsKey(acc.Id)) {
        acc.Total_Opportunity_Amount__c = amountMap.get(acc.Id);
      }
    }
  }
  //========================================================================
  // Once an Account is inserted an email should go to the System Admin user with specified text below.
  // An account has been created and the name is “Account Name”.
  // EXPLANATION: From the below question, we can clearly come to the conclusion that Email has to be sent after the Account is Inserted, so we use “after insert “. When there is bulk insertion then we have to send a list of emails that is why we are using List<Messaging.SingleEmailMessage>. Since the Email has to be sent to System Administrator, we should first get the Email of the Admin using the query. Then we have to loop the Accounts which are getting inserted, then check whether the email id of the Admin is null or not before creating a mail to send. Later for each Account, we have to add a single mail because when each Account is added the System Admin should get an email. Then pass the required fields for sending mail add it to the List of mails and check if the list of emails is empty or not. After that, we are ready to send the list of emails. We can also check whether the mail is sent or not, if not sent you can also check the errors in the logs using the last ” if ” condition which I have written below code.

  public static void sendEmailToAdmin(List<Account> newTrigger) {
    List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

    User userObject = [
      SELECT id, profile.name, email
      FROM user
      WHERE profile.name = 'System Administrator'
    ];

    for (account acc : newTrigger) {
      if (userObject.Email != null) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSenderDisplayName('Salesforce');
        mail.setUseSignature(false);
        mail.toaddresses = new List<String>{ userObject.email };
        mail.setSubject('New Account was Created.');
        String body =
          'Dear System Administrator, <br/> An account has been created. <br/>Account name :' +
          acc.Name +
          '<br/>Account created date :' +
          acc.CreatedDate +
          '<br/>Account created by :' +
          acc.CreatedBy;
        mail.setHtmlBody(body);

        emailList.add(mail);
      }
    }

    if (emailList.size() > 0) {
      Messaging.SendEmailResult[] results = Messaging.sendEmail(emailList);

      if (results[0].success) {
        System.debug('The email was sent successfully.');
      } else {
        System.debug(
          'The email failed to send: ' + results[0].errors[0].message
        );
      }
    }
  }
  //========================================================================
  // Write a trigger on the Account when the Account is updated check all opportunities related to the account. Update all Opportunities Stage to close lost if an opportunity created date is greater than 30 days from today and stage not equal to close won.
  // EXPLANATION: Here we have to update Account related Opportunities based on a condition which is mentioned above in Question. So here we are using ” after update ” because once the Account is updated we are not making changes for the Account which is getting updated instead we are making changes for its related Object Opportunity.

  // First, we have to get the Account Id’s of the Account which is getting updated in a Set<Id> and write a query to get that particular Account Id’s Opportunities, then loop the list of that opportunities and check for the condition given in question then change the values according to the question and also check for the mandatory fields to update in opportunity. Later update the list of Opportunities for which the changes have been applied by adding those to a separate list and updating that list.

  public static void oppStageUpdate(
    List<account> newTrigger,
    List<account> oldTrigger
  ) {
    Set<id> accId = new Set<id>();

    if (newTrigger != oldTrigger) {
      for (Account acc : newTrigger) {
        accId.add(acc.id);
      }
    }

    List<Opportunity> updated = new List<Opportunity>();
    for (Opportunity opp : [
      SELECT AccountId, StageName, CreatedDate
      FROM Opportunity
      WHERE
        StageName != 'Closed Won'
        AND CreatedDate < LAST_N_DAYS:30
        AND AccountId IN :accId
    ]) {
      opp.StageName = 'Closed Lost';
      opp.CloseDate = System.today();
      updated.add(opp);
    }

    if (updated.size() > 0)
      update updated;
  }
  //========================================================================
  // Write a trigger on Account, when an account is inserted, automatically account billing address should populate into the account shipping address.

  // EXPLANATION: When it comes to Account Billing and Shipping Address, we cannot directly enter the values to the field Address because the Address is split into Street, City, State, PostalCode, and Country. We are using ” before insert ” because we need to change the values of the account which is getting inserted. If we use ” after insert ” then the fields of the account we are inserting will become read-only and we will not be able to update that account. This is the reason we are using ” before insert “.

  public static void changeShippingAddress(List<Account> newTrigger) {
    for (Account acc : newTrigger) {
      if (acc.BillingStreet != null)
        acc.ShippingStreet = acc.BillingStreet;

      if (acc.BillingCity != null)
        acc.ShippingCity = acc.BillingCity;

      if (acc.BillingState != null)
        acc.ShippingState = acc.BillingState;

      if (acc.BillingPostalCode != null)
        acc.ShippingPostalCode = acc.BillingPostalCode;

      if (acc.BillingCountry != null)
        acc.ShippingCountry = acc.BillingCountry;
    }
  }
  //========================================================================
  // Create a checkbox field called Out of Zip (default off) . When a Billing Address is updated, get the new Postal Code. Then check which Contacts on the Account are outside of that Postal Code Area. If 1 or more Contacts are outside of the Postal Code Area, mark Out_of_Zip as TRUE.

  public static void checPostalCodArea(
    List<account> newTrigger,
    Map<id, account> oldMap
  ) {
    set<id> idSet = new Set<id>();
    for (Account acc : newTrigger) {
      if (acc.BillingPostalCode != oldMap.get(acc.id).BillingPostalCode) {
        idSet.add(acc.id);
      }
    }

    Integer counter = 0;

    for (Contact con : [
      SELECT AccountId, MailingPostalCode
      FROM contact
      WHERE accountId IN :idSet
    ]) {
      for (Account acc : newTrigger) {
        if (acc.BillingPostalCode != con.MailingPostalCode) {
          counter++;
          if (counter > 0) {
            acc.Out_of_Zip__c = true;
          }
        }
      }
    }
  }
  //========================================================================

  //to reach related contacts, first get accounts' IDs and store them in a set
  //get current account info which contains type with for loop using newTrigger list
  //check if current account type changed or not, to do that use oldTriggerMap get method and put iterated account variable's id as argument and call the old account type. Check if it's changed or not
  //make an soql to get related contacts what IDs in account set and check if email field is not null
  //Create an empty list of Messaging.SingleEmailMessage object and store the email details for related contacts
  //Iterate the contacts and start to create email message and it's details. Use same Messaging.SingleEmailMessage
  //fill out all necessary fields for an email.
  //then store them into a the list we created.
  //if the Messaging list is not empty than send email to the users with Messaging.SendEmailResult[] and assing it to Messaging.sendEmail(emailList) method.
  //to check if message is sent successfully, result.success or result[0].errors[0].message

  // When Account type changes send an email to all related contacts that their account information has been changed.
  // Subject: Account Update
  // Body:  Account information has been updated.
  // Account Name: FS LLC

  public static void sendEmailToRelatedContacts(
    List<Account> newTrigger,
    Map<Id, Account> oldMap
  ) {
    Set<Id> accIdSet = new Set<Id>();

    for (Account acc : newTrigger) {
      //checking if the Account Type value has changed during update
      if (acc.Type != oldMap.get(acc.id).Type) {
        accIdSet.add(acc.Id);
      }
    }

    // Utilities.sendEmailToRelatedAccountContact(accIdSet, 'System Administrator', 'Something important');

    //getting all the contacts related to that Account
    List<Contact> conList = [
      SELECT Id, LastName, Email, AccountId, Account.Name
      FROM Contact
      WHERE AccountId IN :accIdSet AND Email != NULL
    ];

    List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

    if (conList.size() > 0) {
      for (Contact con : conList) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        mail.setTargetObjectId(con.Id);
        mail.setSenderDisplayName('System Administrator');
        mail.setSubject(' Account Update');
        String body =
          'Dear ' +
          con.LastName +
          ', <br/> Account information has been updated.<br/><br/>Account Name : ' +
          con.Account.Name;
        mail.setHtmlBody(body);
        mail.toAddresses = new List<String>{ con.Email };

        //Adding singleEMailMessage to List of singleEMailMessage
        emailList.add(mail);
      }
    }
    if (emailList.size() > 0) {
      //Sending the List of singleEMailMessage
      Messaging.SendEmailResult[] results = Messaging.sendEmail(emailList);
      if (results[0].success) {
        System.debug('The email was sent successfully.');
      } else {
        System.debug(
          'The email failed to send: ' + results[0].errors[0].message
        );
      }
    }
  }

  //========================================================================
  // When we create Account with Industry as Construction then create a Contact for Account, Contact Last Name as Account Name and Contact phone as Account phone.

  public static void accountWithIndustry(List<Account> newTrigger) {
    List<Contact> conList = new List<Contact>();

    for (Account eachAcc : newTrigger) {
      if (eachAcc.Industry == 'Construction') {
        Contact con = new contact();
        con.AccountId = eachAcc.Id;
        con.LastName = eachAcc.Name;
        con.Phone = eachAcc.Phone;
        con.Email = eachAcc.name.substring(0, 4) + 'a@g.com';
        conList.add(con);
      }
    }
    insert conList;
  }
  //========================================================================
  //Method ve Trigger yazilmasi gerekiyor.
  //Write a trigger that creates the number of contacts which are equal to the number which
  // we will enter in the Number of Locations field on the Account Object.

  //This is on account object
  //When account created and location field is not null, create 3 related contact with account name + n

  public static void createNumOfContactsWithAccLocationNum(
    List<Account> newTrigger
  ) {
    List<Contact> conList = new List<Contact>();

    for (Account acc : newTrigger) {
      Decimal numOfLoc = acc.NumberofLocations__c;

      if (numOfLoc > 0) {
        for (Decimal i = acc.NumberofLocations__c; i > 0; i--) {
          Contact con = new Contact(AccountId = acc.Id);
          con.LastName = 'New contact ' + i;
          con.Email = 'newContact' + i + '@mail.com';
          conList.add(con);
        }
      }
    }
    if (conList.size() > 0)
      insert conList;
  }
  //========================================================================
  //Method ve Trigger yazilmasi gerekiyor.

  // Write a trigger on Account,
  // when an account is inserted,
  // automatically account billing address should populate into the account shipping address.
  //========================================================================
  //Method ve Trigger yazilmasi gerekiyor.

  // Once an Account is inserted,
  // an email below should go to the System Admin.
  // An account has been created and the name is “Account Name”.
  //========================================================================
  // Create an Apex trigger that sets an account’s Shipping Postal Code to match the Billing Postal Code if the Match Billing Address option is selected. Fire the trigger before inserting an account or updating an account.

  // Pre-Work:
  // Add a checkbox field to the Account object:

  public static void accountAddressTrigger(List<Account> accountAddress) {
    for (Account acc : accountAddress) {
      if (
        acc.Match_Billing_Address__c == true &&
        acc.BillingPostalCode != null
      ) {
        acc.ShippingPostalCode = acc.BillingPostalCode;
      }
    }
  }
  //========================================================================
  // Write a trigger on the Account when the Account is updated check all opportunities related to the account.
  // Update all Opportunities Stage to close lost if an opportunity created date is greater than 30 days from today and stage not equal to close won.

  public static void updateAccOppStage(List<account> accTriggerNew) {
    List<Opportunity> oppList = [
      SELECT Id, Name, AccountId, StageName
      FROM Opportunity
      WHERE
        StageName != 'Close Won'
        AND CreatedDate < LAST_n_DAYS:30
        AND AccountId IN :accTriggerNew
    ];

    for (Opportunity eachOpp : oppList) {
      eachOpp.StageName = 'Close Lost';
    }
    update oppList;
  }
  //========================================================================
  //Create a new field in Account and Contact object. Name VIP, datatype: checbox.
  //Tigger Requirement: When VIP is updated in Account, update all its Contacts VIP field. (NOTE: Only when VIP field is updated, do the following. If any other field is updated, then it should not do the following)
  // If VIP is checked(true) in Account, VIP should be checked for all the Contacts
  // If VIP is unchecked(false) in Account, VIP should be unchecked in all its Contacts.

  public static void updateVIPForAllContacts(
    List<account> accTriggerNew,
    List<account> accTriggerOld,
    map<id, account> accTriggerNewMap,
    map<id, account> accTriggerOldMap
  ) {
    set<id> setAccIds = new Set<id>();
    for (account eachAcc : accTriggerNew) {
      //new acc vip != old acc vip --> to check if VIP is updated
      if (eachAcc.VIP__c != accTriggerOldMap.get(eachAcc.id).VIP__c) {
        setAccIds.add(eachAcc.id);
      }
    }

    list<contact> listContacts = [
      SELECT id, name, account.id, vip__c
      FROM contact
      WHERE account.id IN :setAccIds
    ];

    for (contact eachContact : listContacts) {
      Account newAcc = accTriggerNewMap.get(eachContact.account.id);
      boolean accVIP = newAcc.vip__c;
      //update account's VIP to contact
      eachContact.vip__c = accVIP;
    }
    if (!listContacts.isEmpty()) {
      update listContacts;
    }
  }

  //AFTER EVENT USAGE EXAMPLE :
  //Create a new field in Account and Contact object. Name VIP, datatype: checbox.
  //Tigger Requirement: When VIP is updated in Account, update all its Contacts VIP field. (NOTE: Only when VIP field is updated, do the following. If any other field is updated, then it should not do the following)
  // If VIP is checked(true) in Account, VIP should be checked for all the Contacts
  // If VIP is unchecked(false) in Account, VIP should be unchecked in all its Contacts.

  public static void updateVIPForAllCon(List<Account> newTrigger) {
    List<Contact> vipUnchecked = [SELECT id, lastname, accountId FROM contact];
    List<Contact> updatedCon = new List<Contact>();

    for (Account acc : newTrigger) {
      for (Contact con : vipUnchecked) {
        if (con.AccountId == acc.id) {
          if (acc.VIP__c == true) {
            con.VIP__c = true;
          } else if (acc.VIP__c == false) {
            con.VIP__c = false;
          }
        }
        updatedCon.add(con);
      }
    }
    if (updatedCon.size() > 0)
      update updatedCon;
  }
  //========================================================================
  // Write Trigger on Account to Update the Associated Contact Account Name Null Whenever Account Record is Updated

  public static void updateAssociatedContact(List<Account> newTrigger) {
    list<Contact> relatedContact = [
      SELECT id, LastName
      FROM Contact
      WHERE AccountId IN :newTrigger
    ];
    list<Contact> updatedContacts = new List<Contact>();
    list<Contact> updatedContacts1 = new List<Contact>();

    for (account acc : newTrigger) {
      for (Contact cnt : relatedContact) {
        cnt.AccountId = acc.Id;
        updatedContacts1.add(cnt);
      }
    }

    update updatedContacts1;

    for (Contact cnt : relatedContact) {
      cnt.AccountId = null;
      updatedContacts.add(cnt);
    }
    update updatedContacts;
  }
  //========================================================================
  public static void updateAccountDescription(
    List<account> accTriggerNew,
    List<account> accTriggerOld,
    map<id, account> accTriggerNewMap,
    map<id, account> accTriggerOldMap
  ) {
    for (account eachAcc : accTriggerNew) {
      //boolean flag to check if we want to update description
      //so false
      Boolean updateDesc = false;
      if (accTriggerOldMap == null && eachAcc.Active__c == 'Yes') {
        system.debug('before and active is yes');
        //true, we want to update it when Active is yes.
        updateDesc = true;
      }
      //if oldMap not null, then old value exists, so it is update
      if (accTriggerOldMap != null) {
        Account oldAcc = accTriggerOldMap.get(eachAcc.id);

        if (
          eachAcc.active__c == 'Yes' &&
          oldAcc.active__c != eachAcc.active__c
        ) {
          system.debug('before update and active is changed to yes');
          updateDesc = true;
        }
      }
      if (updateDesc) {
        eachAcc.description = 'Account is now active. Enjoy!';
      }
    }
  }
  //========================================================================
  // Print the difference between old and new values of Annual revenue field (difference = newValue – oldValue) when Annual revenue field on Account record is updated.

  public static void diferenceOfOldAndNewValue(
    Map<Id, Account> oldMap,
    List<Account> newTrigger
  ) {
    Map<id, Account> oldMapAcc = oldMap;

    for (Account eachNewAcc : newTrigger) {
      Account oldAnnRev = oldMapAcc.get(eachNewAcc.id);
      Decimal oldAnn = oldAnnRev.AnnualRevenue;
      Decimal newAnn = eachNewAcc.AnnualRevenue;

      System.debug(
        'Old annual revenue - New annual revenue = ' + (newAnn - oldAnn)
      );
    }
  }
  //========================================================================
  //BEFORE EVENT USAGE EXAMPLE : Make insert/update in the same object.
  //When 'active' picklist of Account object is updated
  // from 'No/null' to 'Yes'.
  // or if Account is Inserted and 'active' is set to 'Yes',
  // Update 'Description' field value to 'Account is active now. Enjoy!'.
  //Note: Only update the description field When active field is updated. If I update the website/phone of account then it should not update Description field.
  //Also handle Insert scenario.

  public static void whenActivePicklistUpdated(List<Account> newTrigger) {
    for (Account ac : newTrigger) {
      if (ac.active__c == 'Yes') {
        ac.Description = 'Account is active now. Enjoy!';
      } else if (ac.active__c == 'No') {
        ac.Description = '';
      }
    }
  }
  //========================================================================

  //Method ve Trigger yazilmasi gerekiyor.

  // //To send list of mails when list of Accounts inserted
  //   List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
  //   //Query for getting email of SystemAdmin
  //   User usr=[SELECT Id, Profile.Name, Email FROM User WHERE Profile.Name = 'System Administrator'];
  //   for (Account acc : Trigger.new) {
  //       //Check if user email is not null
  //       if (usr.Email!=null) {
  //           //Assign single mail
  //           Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
  //           //Assign sender name
  //           mail.setSenderDisplayName('Future SalesForcers');
  //           //Remove unnecessary fields
  //           mail.setBccSender(False);
  //           mail.setUseSignature(False);
  //           mail.setSaveAsActivity(False);
  //           //Assign receiver email
  //           mail.toaddresses = new String[]{usr.Email};
  //           //Assign Subject
  //           mail.setSubject('New Account has been created');
  //           //An instance for email body
  //           String Body = 'Dear System Adminstrator, New account has been created with the name of ' + acc.Name;
  //           mail.setHtmlBody(body);
  //           //Add single mail list
  //           mails.add(mail);
  //       }
  //   }
  //   //Check if list of mail is empty
  //   if(mails.size()>0){
  //       Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
  //       if (results[0].success) {
  //           System.debug('Email has been sent successfully');
  //       } else {
  //           System.debug('Email failed to send : ' + results[0].errors[0].message);
  //       }
  //   }

  //========================================================================

  //Method ve Trigger yazilmasi gerekiyor.
  /*
  if (Trigger.isInsert || Trigger.isUpdate && Trigger.isBefore) {
    
    for (Account each : Trigger.new) {
      each.ShippingStreet = each.BillingStreet;
      each.ShippingCity = each.BillingCity;
      each.ShippingState = each.BillingState;
      each.ShippingPostalCode = each.BillingPostalCode;
      each.ShippingCountry = each.BillingCountry;
    }
  }
  */

  //========================================================================

  //Method ve Trigger yazilmasi gerekiyor.

  // List<Contact> listContact = new List<Contact>();
  // Map<Id, decimal> mapAcc = new Map<Id, decimal>();

  // for (Account acc : Trigger.new) {
  //   mapAcc.put(acc.id, acc.NumberofLocations__c);
  // }

  // if (mapAcc.size() && mapAcc != null) {
  //   for (Id accId : mapAcc.keyset()) {
  //     for (integer i = 0; i < mapAcc.get(accId); i++) {
  //       contact newContact = new Contact();

  //       newContact.AccountId = accId;

  //       newContact.lastname = 'contact' + 1;
  //       listContact.add(newContact);
  //     }
  //   }
  // }
  // if (listContact.size() > 0 && listContact != null) {
  //   insert listContact;
  // }
}
