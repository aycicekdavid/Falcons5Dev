public class ValidateAddress {
  public void validateHomeAddress() {
    String houseName = 'Papatya';
    String streetName = 'W Papatya Ave';
    String cityName = 'Chicago';
    String stateName = 'Illinois';
    String stateISOCode = 'il';
    String countryName = 'usa';
    String countryISOCode = 'us';

    //1 - Number of characters in the street name.
    System.debug(
      'Number of characters in the street name = ' + streetName.length()
    );

    //2 - Check if the street name contains house name in it or not.
    System.debug(
      'Does the street name contains ' +
      houseName +
      '? =' +
      streetName.contains(houseName)
    );

    //3 - Find if the street name contains the state iso code in it
    System.debug(
      'Does street name contains ' +
      stateISOCode +
      '? =' +
      streetName.contains(stateISOCode)
    );

    //4 - Convert the state iso code, country iso code, country name to upper case and city name, state name to lower case.
    System.debug('Country name to upper case = ' + stateISOCode.toUpperCase());
    System.debug(
      'Country ISO code to upper case = ' + countryISOCode.toUpperCase()
    );
    System.debug('Country name to upper case = ' + countryName.toUpperCase());
    System.debug('City name lower case = ' + countryName.toLowerCase());
    System.debug('State name to lower case = ' + stateName.toLowerCase());

    //5 - Concatenate the house name, street name and store it in a variable.
    String streetAndHouseName = houseName + ' ' + streetName;
    System.debug('Street and house name = ' + streetAndHouseName);

    //6 - Once you are done with the above steps. Create an Apex script to execute the validateHomeAddress method of ValidateAddress class anonymously.
  }
}
