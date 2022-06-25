public with sharing class ContactController {
    @AuraEnabled(cacheable=true)

    public static List<Contact> getContacts(){
    //get top 10 accounts based on annual revenue
     return [SELECT FirstName, LastName, Title, Email, MobilePhone from Contact ORDER BY LastName ASC LIMIT 10];

    }
}
