public class LoopDemo {
  //While loop practice w/o parameter
  public void print_int_while() {
    Integer count = 1;

    while (count <= 25) {
      System.debug(count);

      count++;
    }
  }

  //for loop
  public void print_N_numbers(Integer n) {
    for (Integer i = 0; i < n; i++) {
      System.debug(i);
    }
  }

  //odd numbers
  public void print_Odd_Numbers(Integer startInt, Integer endInt) {
    for (Integer i = startInt; i <= endInt; i++) {
      Integer modI = math.mod(i, 2);
      if (modI == 1)
        System.debug(i);
    }
  }
}
