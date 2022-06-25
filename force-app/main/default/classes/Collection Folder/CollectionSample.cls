public class CollectionSample {
  // Create one class called collectionSample, and that class will have again one welcome message with the non-parameterized constructor.
  // public CollectionSample(){
  //     System.debug(o);
  // }

  public CollectionSample() {
    System.debug('Welcome to the world of Salesforce!');
  }

  // At class level, we can declare two static list variables, one for String and another for Integer. Those two lists we will be using throughout following methods.
  // Method 1 - We will be having one static method to pass the index number, and based on the index number we need to show the specific value stored at specific index, if passing the index number where value doesn't exist we should get relavant message.

  // Note: Above assignment is to utilize the concept of collection(list) and the revision of previously used concepts, so that new things don't overwrite the previously learn concepts.

  // Method 1:
  // Welcome to the world of Salesforce!
  // Input: 2
  // Output:
  // Hello Arla, welcome to the city of the list.

  // Input: 8
  // Output:
  // Sorry! You referred wrong index. Better luck next time!

  public static String employeeInfo(Integer indx) {
    List<String> employee1 = new List<String>();
    employee1.add('Jimmy');
    employee1.add('Ali');
    employee1.add('Veli');
    employee1.add('Kerim');
    employee1.add('Marry');
    employee1.add('Jerry');

    String message = '';

    if (indx >= employee1.size()) {
      message = 'There is no any name at index number ' + indx + '.';
    } else {
      message =
        'The name at index of ' +
        indx +
        ' is ' +
        employee1[indx] +
        '.  Hello ' +
        employee1[indx] +
        '.';
    }

    return message;
  }

  // Method 2 - We will be having another static method to store and show the multiple numbers in single list. We need to give the sum, average, minimum, maximum and duplicate values out of the list.

  // Method 2:
  // Welcome to the world of Salesforce!
  // Input: 5, 2, 8, 16, 17, 5, 3, 9, 7
  // Output:
  // The sum of above numbers is 72
  // The minimum number is 2
  // The maximum number is 17
  // The average is 8
  // The repetitive number is 5

  public static void multipleNumbersInList() {
    List<Integer> nums = new List<Integer>();
    nums.add(5);
    nums.add(2);
    nums.add(8);
    nums.add(16);
    nums.add(17);
    nums.add(5);
    nums.add(3);
    nums.add(9);
    nums.add(17);

    Integer sum = 0;
    Integer avr = 0;
    Integer min = nums[0];
    Integer max = nums[0];
    Set<Integer> temp = new Set<Integer>();
    Set<Integer> dup = new Set<Integer>();

    for (Integer i = 0; i < nums.size(); i++) {
      sum += nums[i];

      if (nums[i] < min)
        min = nums[i];

      if (nums[i] > max)
        max = nums[i];
    }

    avr = sum / nums.size();

    for (Integer num : nums) {
      if (!temp.add(num)) {
        dup.add(num);
      }
    }

    System.debug('The sum of above numbers is ' + sum);
    System.debug('The minimum number is ' + min);
    System.debug('The maximum number is ' + max);
    System.debug('The average is ' + avr);
    System.debug('The repetitive number(s) is ' + dup);
  }
}
