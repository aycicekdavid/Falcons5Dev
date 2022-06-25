public class PrimitiveDataTypePractice {
  public void primitiveTest() {
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
}
