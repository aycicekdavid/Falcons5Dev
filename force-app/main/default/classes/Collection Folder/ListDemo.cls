public class ListDemo {
  public static void candidateList() {
    //1. Creating empty list of String
    List<String> listCandidates = new List<String>();

    System.debug(listCandidates);

    listCandidates.add('Marc');
    listCandidates.add('Elon');
    listCandidates.add('Bill');
    listCandidates.add('Marc');

    System.debug('Candidates are ' + listCandidates);
  }

  public static void randomIntegerList() {
    List<Integer> listInteger = new List<Integer>();

    listInteger.add(11);
    listInteger.add(3);
    listInteger.add(6);
    listInteger.add(87);

    System.debug('Integers are ' + listInteger);

    Integer index3Value = listInteger.get(3);
    Integer index3Value2 = listInteger[3];

    System.debug('Index 3 value is ' + index3Value);
    System.debug('Index 3 value2 is ' + index3Value2);

    System.debug('List of integer list ' + listInteger);
  }

  public static String candidateList(Integer i) {
    //1. Creating empty list of String
    List<String> listCandidates = new List<String>();

    System.debug(listCandidates);

    listCandidates.add('Marc');
    listCandidates.add('Elon');
    listCandidates.add('Bill');
    listCandidates.add('Marc');

    String candidateI = listCandidates[i];

    System.debug('Candidate is ' + candidateI);

    return candidateI;
  }

  public static String candidateList2(Integer i) {
    List<String> listCandidates = new List<String>();

    listCandidates.add('Marc');
    listCandidates.add('Elon');
    listCandidates.add('Bill');
    listCandidates.add('Marc');

    System.debug(listCandidates[i]);

    String returnString = '';

    if (i < listCandidates.size()) {
      returnString = listCandidates[i];
    } else {
      returnString = 'No value found. Stay in limits.';
    }
    return returnString;
  }

  public static void allCats() {
    Cat falconCat = new Cat('fluffykins', 'white');
    Cat vitapsCat = new Cat('Simba', 'brown');
    Cat sumitCat = new Cat('Smokey', 'gray');

    List<Cat> cats = new List<Cat>();

    cats.add(falconCat);
    cats.add(vitapsCat);
    cats.add(sumitCat);
    cats.add(vitapsCat);
    cats.add(vitapsCat);

    System.debug('all cats are ' + cats);

    if (!cats.isEmpty()) {
      cat caAt3 = cats[3];
      System.debug('Cat at 3 is  ' + caAt3);
    }
  }

  public static void iterateIntegerList() {
    List<Integer> listInteger = new List<Integer>();
    listInteger.add(10);
    listInteger.add(15);
    listInteger.add(21);
    listInteger.add(15);

    for (Integer eachInteger : listInteger) {
      System.debug(eachInteger);
    }
  }

  public static void allCats() {
  }
}
