// 1. Store the currency exchange rate values in a Map named ‘currISOCodeAndExchangeRateMap’ for any 5 currency ISO codes. Like below:
// a. AUD => 0.73
// b. CAD => 0.78
// c. EUR => 1.13
// d. NZD => 0.68
// e. INR => 0.013

Map<String, Decimal> currISOCodeAndExchangeRateMap = new Map<String, Decimal>();
currISOCodeAndExchangeRateMap.put('AUD', 0.73);
currISOCodeAndExchangeRateMap.put('CAD', 0.78);
currISOCodeAndExchangeRateMap.put('EUR', 1.13);
currISOCodeAndExchangeRateMap.put('NZD', 0.68);
currISOCodeAndExchangeRateMap.put('TRL', 0.07);

System.debug(currISOCodeAndExchangeRateMap);

// 2. Fetch the currency conversion rate for any one currency ISO code and print it.

System.debug('TRL to USD Conversion rate ' + currISOCodeAndExchangeRateMap.get('TRL'));

// 3. Check if the above Map have conversion rate for SAD ISO code.

System.debug('is Conversion rate for SAD available ' + currISOCodeAndExchangeRateMap.containsKey('SAD'));

// 4. Collect all the currecny ISO codes from currISOCodeAndExchangeRateMap for which the conversion rate is >= 1 in one variable and other iso codes in other variable. Expected Output: EUR – In one variable AUD, CAD, NZD and INR – In another variable.

List<String> greaterThanOne = new List<String>();
List<String> lessThanOne = new List<String>();

// Set<String> greaterThanOne = new Set<String>();
// Set<String> lessThanOne = new Set<String>();

for(String isoCode : currISOCodeAndExchangeRateMap.keySet()){

    if(currISOCodeAndExchangeRateMap.get(isoCode) >= 1){
       greaterThanOne.add(isoCode);
    }else {
        lessThanOne.add(isoCode);
    }

}
System.debug('All currency ISO codes which have higher than or equal USD ' + greaterThanOne);
System.debug('All currency ISO codes which have lower value than USD ' + lessThanOne);



