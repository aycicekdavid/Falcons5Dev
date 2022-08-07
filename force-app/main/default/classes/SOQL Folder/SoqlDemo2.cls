public class SoqlDemo2 {

  public static void childToParent_soql1() {

    list<contact> listCnt = [SELECT id, name, account.name, account.industry FROM contact WHERE account.industry = 'Energy'];

    for (contact eachContact : listCnt) {
      string accName = eachContact.account.name;
      system.debug('\n Contact name: ' + eachContact.name + 
      ' \n Account name: ' + accName + ' \n Industry: ' + eachContact.account.Industry);
    }
  }


  public static void sampleSoql4() {

    List<account> accWithOppList = [SELECT Name, annualRevenue, (SELECT Name, amount FROM opportunities WHERE stageName = 'Closed Won')
    FROM account];

    for (account acc : accWithOppList) {
      system.debug('Account name ' + acc.Name + ' and its annual rev ' + acc.annualRevenue);

      list<opportunity> listOpp = acc.opportunities;

      for (opportunity opp : listOpp) {
        system.debug('opportunity name ' + opp.name);
        system.debug('opportunity amount ' + opp.amount);
      }
    }
  }
}