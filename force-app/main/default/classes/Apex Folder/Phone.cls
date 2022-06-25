public class Phone {
  boolean touchscreen;
  static final String walmartCEO;
  integer memory;
  String model;
  String color;
  long phoneNumber;

  public static void ring() {
    System.debug('Phone is ringing.');
  }

  public Phone(String model, String color) {
    this.model = model;
    this.color = color;
  }
}
