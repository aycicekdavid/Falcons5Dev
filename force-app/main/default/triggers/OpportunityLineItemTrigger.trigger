trigger OpportunityLineItemTrigger on OpportunityLineItem(
  before insert,
  before update,
  after insert,
  after update
) {
  //==============================================================

  //When opportunity line item is created, insert a quotation too .

  Set<Id> oppId = new Set<Id>();

  for (OpportunityLineItem oppProd : Trigger.new) {
    oppId.add(oppProd.OpportunityId);
  }

  List<Quote> qList = new List<Quote>();

  List<Opportunity> oppList = [
    SELECT Id, Name, Account.Name
    FROM Opportunity
    WHERE Id = :oppId
  ];

  if (oppList.size() > 0) {
    for (Opportunity opp : oppList) {
      Quote q = new Quote();
      q.OpportunityId = opp.Id;
      q.Name = opp.Name + ' ' + opp.Account.Name; //It is not mandatory to write Account name but we want to make it better.
      qList.add(q);
    }

    if (qList.size() > 0) {
      insert qList;
    }
  }
  //=============================================================
}
