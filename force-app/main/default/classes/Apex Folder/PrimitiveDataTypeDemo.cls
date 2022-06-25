public class PrimitiveDataTypeDemo {
  public void printBasicDataType() {
    string batchName = 'Falcons 5';
    integer totalCandidates = 80;
    boolean isAdminCompleted = true;

    string batchDescription = batchName + ' are the bestest.';
    system.debug(batchDescription);
    system.debug('total # of candidates: ' + totalCandidates);

    Decimal decValue = 27.01;
    system.debug('decimal : ' + decValue);

    Long longValue = 3146786654L;
    system.debug('long: ' + longValue);

    Object obj = 'This is a string';
    Object obj2 = 10;

    system.debug('obj = ' + obj);
    system.debug('obj2 = ' + obj2);

    ID id1 = '0015j00000WXODgAAP';
    system.debug('id is ' + id1);
  }

  public void printNewDate() {
    system.debug('create new date instance');
    Date newDate = Date.newInstance(1995, 2, 17);
    Date newDate2 = Date.newInstance(2021, 10, 7);
    system.debug('new date = ' + newDate);
    system.debug('newDate 2 is ' + newDate2);

    Date todayDate = date.today();
    system.debug('today\'s date : ' + todayDate);
  }

  public void printNewTime() {
    Time myTime = Time.newInstance(18, 20, 2, 30);
    Time meTime = time.newInstance(11, 11, 11, 11);
    system.debug('my time - ' + myTime);
    system.debug('mee time - ' + meTime);
  }

  public void printNewDateTime() {
    date newDate = date.today();
    time newtime = time.newInstance(23, 23, 23, 23);

    Datetime dt1 = Datetime.newInstance(newDate, newTime);
    system.debug('first date time instance is ' + dt1);

    //2. Year, month, day
    Datetime dt2 = Datetime.newInstance(2025, 1, 9);
    System.debug('dt 2 is ' + dt2);

    //3. create datetime using YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
    datetime dt3 = datetime.newInstance(2021, 10, 9, 10, 10, 10);
    system.debug('dt 3 is ' + dt3);

    //Create newInstance from milliseconds
    //Construct a new datetime using milloseconds since Jan 1 1970 00:00:00 GMT

    Long longtime = 1991568183000L;
    DateTime dt4 = DateTime.newInstance(longtime);
    System.debug('d4 long time ' + dt4);

    // Create GMT datetime using YEAR, MONTH, DAY, HOUR, MINUTE, SECOND

    DateTime dt5 = DateTime.newInstanceGMT(1998, 1, 28, 18, 2, 3);
    System.debug('dt5 GMT time ' + dt5);

    //Current Time
    DateTime dt6 = DateTime.now();
    System.debug('dt6 present time ' + dt6);
  }
}
