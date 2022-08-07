public with sharing class OpportunityController {

     //get records which stageName is Closed Won
     @AuraEnabled(cacheable=true)
     public static List<Opportunity> getOppsByStageName(String stage){
 
      return [SELECT Name, Type, StageName, Amount from Opportunity WHERE StageName = :stage and Amount != null LIMIT 10];
 
     }

     //get all the Opps whose types matches with the given input
     @AuraEnabled(cacheable=true)
     public static List<Opportunity> getOppsByType(String type){
 
      return [SELECT Name, Type, StageName, Amount from Opportunity WHERE Type = :type LIMIT 10];
 
     }

}