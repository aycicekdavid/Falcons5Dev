public class ApexHoursPractices {
  // Write an Apex program
  // - to store all the numbers in a List starting from 1 until 20.
  // - Only numbers stored at even positions in the List should be added to get their sum which should be output to the Debug Log.

  public static Integer evenNumbers(List<Integer> lst) {
    Integer sum = 0;

    for (Integer i = 1; i < 20; i++) {
      if (Math.mod(i, 2) == 0) {
        lst.add(i);
        sum += i;
      }
    }
    System.debug('List of the even numbers = ' + lst);
    System.debug('Sum of the even values in the list = ' + sum);
    return sum;
  }

  public static void oppList() {
    List<Account> accList = [SELECT name, id FROM Account WHERE name LIKE 'b%'];

    for (Account acc : accList) {
      acc.Name = acc.Name.substringBefore(' copied from');
    }
    update accList;
  }
}
