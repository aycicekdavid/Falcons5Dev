public class Assignement5 {

    //Prepare a method which will return all the Accounts for which at least a contact is present.
    List <Account> accWithContact = [SELECT id, Name, 
    (SELECT Id, FirstName FROM Contacts WHERE FirstName != null) 
    FROM Account];


    
    
    
    // 7. Print the Annual revenue and name of all the accounts of type  'Customer-Direct' and 
    // - print the Opportunity Name and Amount for the respective 'Closed Won' opportunities. 
    // Printing should be done one by one in different lines.

    // 6. Prepare a method which will return all the Accounts for which at least a closed Won
    // Opportunity is present. Make it dynamic if we want to bring account for other opportunity
    // stageNames.

    public static List<Account> closedWonAccounts(String stageNm) {

        List<Account> closedWOpps = [SELECT id, Name, 
        (SELECT Name, StageName, Amount FROM Opportunities WHERE StageName = :stageNm) 
        FROM Account];

        List<Account> result = new List<Account>();
        Decimal amn = 0.00;
        Decimal grandTotal = 0.00;
        Integer counter = 1;

        for(Account cWO : closedWOpps){

            for(Opportunity stNm : cWO.Opportunities){
                String stg = stNm.StageName;
                amn = stNm.Amount;

                if(stg == stageNm && closedWOpps != null){
                    grandTotal += amn;
                    System.debug(counter++ + '. Account Name : ' + cWO.Name);
                    System.debug('Opportunity stage name : ' + stg);
                    System.debug('Opportunity Name : ' + stNm.Name);
                    System.debug('Opportunity Amount : ' + amn);

                    result.add(cWO); 
                }
            }
        }
        System.debug('Total Opportunity Number : ' + result.size() + ' and the GRAND TOTAL : ' + grandTotal + ' Average : ' + ((Integer)grandTotal / result.size()));
        return result;    
    }
    
    
    
    // 5. Prepare a method which returns the sum of all the opportunities Amount present in the org.
    public static Decimal sumOfAmounts() {

        List<Opportunity> sumAmountLst = [SELECT Name, Amount FROM Opportunity];

        Decimal sum = 0.00;
        for(Opportunity eachAmo : sumAmountLst){

            sum += eachAmo.Amount;
        }
        System.debug('THE GRAND TOTAL = ' + sum);
        return sum;
    }

    
    // 4. Find all the opportunities which has Lead Source as 'Web' and Stage as 'Closed Lost'. Make it dynamic so that it works for other stages and Lead sources as well.


    public static void leadSource(String stageName, String leadSrc) {

        List<Opportunity> allOpps = [SELECT Name, LeadSource FROM Opportunity WHERE StageName = :stageName AND LeadSource = :leadSrc];
        System.debug(allOpps);
    }


    // 3. Print all the opportunities (fetch Amount, Name and Account Name fields) with Stage as 'Closed Won' and make it dynamic so that it should work for other stages as well.

    public static void closedWonOpps(String stageName) {

        List <Opportunity> opp = [SELECT Name, Amount, Account.name FROM Opportunity WHERE StageName= : stageName];
        System.debug(opp);
   
    }


    // 2. Prepare a method which will return the List of Accounts (fetch any 3 fields) for a particular Type. Type should be sent as a parameter in the method.

    public static List<Account> qu3(String typeStr) {

        List<Account> typeList = [SELECT Type, ID, Name FROM Account WHERE Type = :typeStr];
        List<Account> newAccLst = new List<Account>();
    
        for (Account eachacc : typeList) {
    
          String accType = eachacc.Type;
          if (accType == typeStr) {
    
            newAccLst.add(eachacc);
          }
        }
        System.debug(newAccLst);
        return newAccLst;
      }

      // 1. - Write the logic to fetch and return all the accounts. 
      //    - Include account name, annual revenue, type, and source of account.
        public static void allAccounts() {

            List<Account> allAcc = [SELECT Name, AnnualRevenue, Type, AccountSource  FROM Account];
            System.System.debug(allAcc);
            
        }
  
}