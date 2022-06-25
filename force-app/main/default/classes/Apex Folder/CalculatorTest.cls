@isTest
public class CalculatorTest {
  @isTest
  public static void testMessage() {
    Calculator.welcomeMessage();
    Calculator.printNewMessage('This is from atest method');
  }

  @isTest
  public static void test2() {
    Integer i = Calculator.add(3, 3);

    System.assertEquals(6, i);
  }

  @isTest
  public static void test3() {
    Integer intgr = Calculator.add(2, 8, 3);

    System.assertEquals(13, intgr);
  }

  @isTest
  public static void test4() {
    List<Integer> intg = new List<Integer>{ 1, 3, 45, 5, 8 };

    Integer i = Calculator.add(intg);

    System.assertEquals(62, i);
  }

  @isTest
  public static void test5() {
    Calculator.getPerfectAverage(0, 10);
  }
}
