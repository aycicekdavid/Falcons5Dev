public class Utilities {

    public static void sendEmailToRelatedAccountContact(Set<Id> accIdSet, String sender, String mailSubject) {

        List<Contact> conList = [SELECT Id, LastName, Email, AccountId, Account.Name FROM Contact WHERE AccountId IN :accIdSet];

        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

        if (conList.size() > 0) {

        for (Contact conObj : conList) {
        //checking if the Contact Email is null
        if (conObj.Email != null) {

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(conObj.Id);
        mail.setSenderDisplayName(sender);
        // mail.setUseSignature(false);
        // mail.setBccSender(false);
        // mail.setSaveAsActivity(false);
        mail.setSubject(mailSubject);
        String body = 'Dear ' + conObj.LastName + ', <br/>' + 'Account information has been updated.<br/><br/>Account Name : ' +  conObj.Account.Name;
        mail.setHtmlBody(body);
        mail.toAddresses = new List<String>{ conObj.Email };
        //Adding singleEMailMessage to List of singleEMailMessage
        emailList.add(mail);
      }
    }
  }
  if (emailList.size() > 0) {
    //Sending the List of singleEMailMessage
    Messaging.SendEmailResult[] results = Messaging.sendEmail(emailList);
    if (results[0].success) {
      System.debug('The email was sent successfully.');
    } else {
      System.debug(
        'The email failed to send: ' + results[0].errors[0].message);
    }
  }
    }

    
}