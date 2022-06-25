public class SetDemo {
  public static void citySet() {
    Set<String> cities = new Set<String>();
    cities.add('Tokyo');
    cities.add('Lisbon');
    cities.add('Berlin');
    cities.add('Nairobi');
    cities.add('Tokyo');
    cities.add('Berlin');
    cities.add('Nairobi');

    System.debug('set of cities: ' + cities);
  }

  public static void randomIntegerSet() {
    Set<Integer> setInteger = new Set<Integer>();
    setInteger.add(10);
    setInteger.add(15);
    setInteger.add(21);
    setInteger.add(15);
    setInteger.add(15);

    System.debug('set of random integers: ' + setInteger);
  }

  public static Set<Integer> setFromList(List<Integer> intList) {
    Set<Integer> intSet = new Set<Integer>();
    intSet.addAll(intList);

    return intSet;
  }

  public static Set<String> upperCaseSet(Set<String> setString) {
    Set<String> returnSet = new Set<String>();

    System.debug('setString ' + setString);

    for (String eachStr : setString) {
      System.debug(eachStr);
      String tempStr = eachStr.toUpperCase();
      returnSet.add(tempStr);
    }

    return returnSet;
  }
}
