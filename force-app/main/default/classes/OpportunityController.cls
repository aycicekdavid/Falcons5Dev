public with sharing class OpportunityController {

     //get records which stageName is Closed Won
     @AuraEnabled(cacheable=true)
     public static List<Opportunity> getOppsByStageName(String stage){
 
      return [SELECT Name, Type, StageName, Amount from Opportunity WHERE StageName = :stage and Amount != null LIMIT 10];
 
     }
    //get all the opps whose type matches with the given input
    @AuraEnabled
    public static List<Opportunity> getOppsByType(String type) {
        return [SELECT Name, Type, Amount, StageName
                FROM Opportunity
                WHERE Type = :type
                WITH SECURITY_ENFORCED
                LIMIT 10];
    }

}
