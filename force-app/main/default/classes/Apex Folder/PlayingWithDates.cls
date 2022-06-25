public class PlayingWithDates {
  public void printDateOutput() {
    //1 - Print today's date.
    Date todaysDate = Date.today();
    System.debug('Today\'s date is ' + todaysDate);
    //System.today();

    //2 - Create an instance of a date for 5th November 2789.
    Date fithOfNov = Date.newInstance(2789, 11, 5);
    System.debug('New date instance ' + fithOfNov);

    //3 - Create an instance of a date for 4th March 1459.
    Date forthOfMarch = Date.newInstance(1459, 3, 4);
    System.debug(forthOfMarch);

    //4 - Create three Integer variables (dayInt, monthInt, yearInt) for storing day, month, year respectively and provide some default values in them.
    Integer dayInt = 11;
    Integer monthInt = 3;
    Integer yearInt = 2022;

    //5 - Using the three Integer variables (dayInt, monthInt, yearInt) create a new date instance and save it in a new variable.

    Date fullDate = Date.newInstance(yearInt, monthInt, dayInt);
    System.debug('full date = ' + fullDate);

    //6 - Print the date which is exactly 67 days after today.
    // System.debug('The date which is exactly 67 days after
    Date tdDate = Date.today();
    System.debug('67 days after = ' + tdDate.addDays(67));

    //7 - Find and print a date which was exactly 7 months earlier than today.
    System.debug('Seven months earlier ' + tdDate.addMonths(-7));

    //8 - Find and print a date which was exactly 895 days earlier than today.
    System.debug('8 years earlier ' + tdDate.addDays(-895));

    //9 - Find and print a date which was exactly 59 years earlier than today.
    System.debug('59 years earlier ' + tdDate.addYears(-59));

    //10 - Print the date which is exactly 278 years after today
    System.debug('278 years later ' + tdDate.addYears(278));
  }

  /*
        - Create a new method in 'PlayingWithDates' class and 
        - name it as 'olympicGamesAge'.
        - Find the age of Olympic games in terms of: (FYR : Fist Olympic held on 6 April 1896)
	        a. months
	        b. days
	        c. years
       - And also Find if the first olympic held was in leap year or not.
       */

  public void olympicGamesAge() {
    Date tdy = Date.today();
    Date olympicGamesStart = Date.newInstance(1896, 5, 6);
    Integer olympYear = olympicGamesStart.year();

    Integer olympicGamesAgeMonths = olympicGamesStart.daysBetween(tdy);
    Integer olympicGamesAgeDays = olympicGamesStart.monthsBetween(tdy);
    Integer olympicGamesAgeYears = tdy.year() - olympicGamesStart.year();

    Boolean isOlympicLeap = Date.isLeapYear(olympYear);

    System.debug(
      'months = ' +
      olympicGamesMonths +
      '/days   = ' +
      olympicGamesAgeDays +
      '/years  = ' +
      olympicGamesAgeYears +
      'is leap year? = ' +
      isOlympicLeap
    );
  }
}
