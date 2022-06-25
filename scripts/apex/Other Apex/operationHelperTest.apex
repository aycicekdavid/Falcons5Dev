
// OperationsHelper operation = new OperationsHelper();
// System.debug(operation.largestOutOfTwoNumbers(2, 1));
// System.debug(operation.smallestOutOfThreeNumbers(3, 1, 5));
// System.debug(operation.sumofPositiveIntegers(1000));
// System.debug(operation.sumofPositiveIntegers(-6));

List<Decimal> myList = new List<Decimal>();
myList.add(2.22);
myList.add(3.33);
myList.add(4.44);
myList.add(1.00);

OperationsHelper sumList = new OperationsHelper();
Decimal theSum = sumList.sum(myList);
System.debug('The sum = ' + theSum);

OperationsHelper averageList = new OperationsHelper();
Decimal theAverage = averageList.average(myList);
System.debug('The average = ' + theAverage);

OperationsHelper highestList = new OperationsHelper();
Decimal theHighest = highestList.highest(myList);
System.debug('The highest = ' + theHighest);

OperationsHelper smallestList = new OperationsHelper();
Decimal theSmallest = smallestList.smallest(myList);
System.debug('The smallest = ' + theSmallest);

OperationsHelper reverse = new OperationsHelper();
reverse.reverseList(myList);



