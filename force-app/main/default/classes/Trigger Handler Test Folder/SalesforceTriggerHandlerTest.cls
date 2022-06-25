@isTest
public class SalesforceTriggerHandlerTest {
  @isTest
  public static void testMethod1() {
    salesforce_project__c sp1 = new salesforce_project__c();
    sp1.Project_Name__c = 'Teach TESTS to Falcons';
    sp1.Description__c = 'All 50% are great learners, still';
    sp1.status__c = 'New';

    salesforce_project__c sp2 = new salesforce_project__c();
    sp2.Project_Name__c = 'Teach TESTS2 to Falcons';
    sp2.Description__c = 'All 50% are great learners, still';
    sp2.status__c = 'New';

    list<salesforce_project__c> listSP = new List<salesforce_project__c>{
      sp1,
      sp2
    };
    insert listSP;

    set<id> spIds = new Set<id>{ sp1.id, sp2.id };

    Test.startTest();
    SalesforceProjectTriggerHandler.updateProjectDescription(spIds);
    Test.stopTest();

    List<salesforce_project__c> sps = [
      SELECT id, description__c
      FROM salesforce_project__c
    ];
    system.assert(sps[0].Description__c.contains('Future'));
  }
}
