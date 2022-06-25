public class Calculator {
  public static void welcomeMessage() {
    System.debug('Welcome to Apex calc.');
  }

  //method name printNewMessage
  //# of parameter: 1
  //data type of parameter: string
  //return type:  void

  public static void printNewMessage(string msg) {
    system.debug(msg);
    //from where will we get value of msg?
    //from wherever we call this method.
  }

  //Dynamic method with parameter
  public static Integer add(Integer a, Integer b) {
    Integer sum = a + b;

    //System.debug('Sum = ' + sum);

    return sum;
  }

  //Method name: add
  //# of parameters: 3
  public static Integer add(Integer int1, Integer int2, Integer int3) {
    return int1 + int2 + int3;
  }

  public static void getPerfectAverage(Integer num1, Integer num2) {
    Integer sum = 0;
    Integer size = 0;
    Integer average = 0;

    for (Integer i = num1; i <= num2; i++) {
      sum += i;
      size++;
    }
    average = sum / size;
    System.debug('The perfect average is ' + average);
  }

  public static integer add(list<integer> randomIntLst) {
    integer returnInteger = 0;
    for (integer eachInt : randomIntLst) {
      system.debug(eachInt);
      returnInteger += eachInt;
    }
    return returnInteger;
  }
}
