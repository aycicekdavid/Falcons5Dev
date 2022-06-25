public class OperationsHelper {
  // 1. Create a class named as operationsHelper.
  // Done

  // 2. Now create the following methods in the class as per the given requirement:
  // a. Method Name – largestOutOfTwoNumbers
  // 3. Description - It should have two parameters which can accept two decimal numbers and should return the largest number.
  public Decimal largestOutOfTwoNumbers(Decimal num1, Decimal num2) {
    if (num1 > num2) {
      return num1;
    }
    return num2;
  }

  // 4. b. Method Name – smallestOutOfThreeNumbers
  // 5. Description - It should have three parameters which can accept three decimal numbers and should return the smallest number.
  public Decimal smallestOutOfThreeNumbers(
    Decimal num1,
    Decimal num2,
    Decimal num3
  ) {
    if (num1 < num2 && num1 < num3) {
      return num1;
    } else if (num2 < num1 && num2 < num3) {
      return num2;
    }
    return num3;
  }

  // 6. c. Method Name - sumofPositiveIntegers
  // 7. Description - It should return the summation of first n numbers. n is the input parameter of type Integer.
  // 8. if n is negative then show this message- "We are not calculating the sum for negative numbers" and return null value.
  // 9. if n is positive, from 1 to n, sum all the integers and return it.
  public Integer sumofPositiveIntegers(Integer n) {
    Integer sum;

    if (n < 0) {
      sum = null;
      System.debug('We are not calculating the sum for negative numbers');
      return sum;
    } else {
      sum = 0;
      for (Integer i = 1; i <= n; i++) {
        sum += i;
      }
      return sum;
    }
  }

  // 1. Define different methods in the operationsHelper class to do the following:
  // a. Sum
  // b. Average
  // c. Highest
  // d. Lowest
  // Of Decimal values from the provided List.
  // Please note every method should have an input parameter of type List.
  // If the provided list is empty, then show a message like “Please provide values to do the operation” and return null otherwise return the calculated value.

  public Decimal sum(List<Decimal> myList) {
    Decimal theSum;
    if (myList.isEmpty()) {
      System.debug('Please provide values to do the operation');
    } else {
      theSum = 0.00;
      for (Decimal eachDec : myList) {
        theSum += eachDec;
      }
    }
    return theSum;
  }

  public Decimal average(List<Decimal> myList) {
    Decimal theAverage;

    if (myList.isEmpty()) {
      System.debug('Please provide values to do the operation');
    } else {
      Decimal avrg = this.sum(myList);

      theAverage = avrg / myList.size();
    }
    return theAverage;
  }

  public Decimal highest(List<Decimal> myList) {
    Decimal theHighest;

    if (myList.isEmpty()) {
      System.debug('Please provide values to do the operation');
    } else {
      theHighest = myList.get(0);

      for (Decimal each : myList) {
        if (each > theHighest) {
          theHighest = each;
        }
      }
    }
    return theHighest;
  }
  public Decimal smallest(List<Decimal> myList) {
    Decimal theSmallest;

    if (myList.isEmpty()) {
      System.debug('Please provide values to do the operation');
    } else {
      theSmallest = myList.get(0);

      for (Decimal each : myList) {
        if (each < theSmallest) {
          theSmallest = each;
        }
      }
    }
    return theSmallest;
  }

  // 2. Create another method in the same class which can print the elements of any provided list in the reverse order.

  public void reverseList(List<Decimal> myList) {
    for (Integer i = myList.size() - 1; i >= 0; i--) {
      System.debug(myList.get(i));
    }
  }
}
