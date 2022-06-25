public class StringDemoClass {
  public void stringMethod1() {
    String sessionDescription = 'learning string methods in apex language is FUN.';

    integer lengthOfStr = sessionDescription.length();
    System.debug('The length of string is = ' + lengthOfStr);

    String sessionDescription2 = sessionDescription.toUpperCase();
    System.debug(sessionDescription2);

    sessionDescription2 = sessionDescription2.toLowerCase();
    System.debug(
      'Reassigning the same String  and make it lower case: ' +
      sessionDescription2
    );

    Boolean isApexContained = sessionDescription.contains('Apex');
    //Result is False, because contains() method is case sensetive.
    System.debug(isApexContained);

    Boolean ignorCaseSample = sessionDescription.containsIgnoreCase('Apex');
    System.debug(ignorCaseSample);

    Boolean isContainSalesforce = sessionDescription.contains('Salesforce');
    System.debug(isContainSalesforce);

    String trimExample = '  life is beatiful ';
    System.debug(trimExample.trim());
  }

  public void printNewDate() {
    System.debug('Create a new Date instance');

    Date newDate = Date.newInstance(1995, 2, 17);
    Date newDate2 = Date.newInstance(2021, 10, 7);

    Date todayDate = Date.today();

    System.debug(newDate);
    System.debug(newDate2);
    System.debug('Today\'s date is ' + todayDate);
  }

  public void printNewTime() {
    Time myTime = Time.newInstance(18, 20, 2, 30);
    Time myTime2 = Time.newInstance(15, 15, 2, 20);

    System.debug(myTime);
    System.debug(myTime2);
  }

  public void printNewDateTime() {
    Date newDate = Date.newInstance(1995, 2, 17);
    Date newDate2 = Date.newInstance(2021, 10, 7);

    Time myTime = Time.newInstance(18, 20, 2, 30);
    Time myTime2 = Time.newInstance(15, 15, 2, 20);

    System.debug(
      'The date and time is : ' + DateTime.newInstance(newDate, myTime)
    );

    DateTime dt1 = DateTime.newInstance(2025, 1, 9);
    System.debug('dt1 is ' + dt1);
  }
}
