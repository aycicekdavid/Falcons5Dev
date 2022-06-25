public class StringArray {
  // Create an Apex class with a method that returns a list of formatted strings.
  // The Apex class must be called StringArray and be in the public scope

  // The Apex class must have a public static method called generateStringArray
  // The method must return a list of strings.
  // The method must accept an incoming Integer as a parameter, which will be used to determine the number of returned strings
  // The length of the list is determined by an integer parameter.
  // -   Each element in the list must have the format Test n, where n is the index of the current string in the list.
  // The generateStringArray method must return a list of strings

  public static List<String> generateStringArray(Integer lengtOfList) {
    String[] arrString = new List<String>();

    for (Integer i = 0; i < lengtOfList; i++) {
      arrString.add('\'Test ' + i + '\'');
    }
    System.debug(arrString);

    return arrString;
  }

  // For example,
  // -   if the input is 3, then the output should be ['Test 0', 'Test 1', 'Test 2']. // Remember that in Apex, the index position of the first element in a list is always 0.
}
