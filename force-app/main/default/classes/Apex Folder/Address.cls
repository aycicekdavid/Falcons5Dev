public class Address {
  public void homeAddress() {
    String myName = 'Erdal Aycicek';
    Integer memberOfFamily = 4;
    String houseName = 'Papatya';
    String houseNumber = '456';
    String streetName = 'W Hollywood Ave';
    String cityName = 'Chicago';
    String stateName = 'Illinois';
    String isoCode = 'IL';
    String countryName = 'USA';
    String countryISOCode = 'US';
    String zipCode = '60659';
    Boolean isThisCurrentHome = true;

    System.debug('My name is ' + myName);
    System.debug('Member of Family : ' + memberOfFamily);
    System.debug('House name: ' + houseName);
    System.debug('House number: ' + houseNumber);
    System.debug('Street name: ' + streetName);
    System.debug('City name: ' + cityName);
    System.debug('State name: ' + stateName);
    System.debug('ISO code: ' + isoCode);
    System.debug('Country name: ' + countryName);
    System.debug('Country ISO code: ' + countryISOCode);
    System.debug('Zip code: ' + zipCode);
    System.debug('Is this the current home: ' + isThisCurrentHome);
  }
}
