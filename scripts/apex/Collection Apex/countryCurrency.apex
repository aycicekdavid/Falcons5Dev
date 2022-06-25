Map<String,String> mapCntCurrency = new Map<String,String>();

mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('Japan', 'Yen');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('India', 'Rupee');
mapCntCurrency.put('India', 'Rupees');
mapCntCurrency.put('Turkey', 'Lira');

System.debug('Map of country vs currency ' + mapCntCurrency);

String IndiaCurrency = mapCntCurrency.get('India');
String TurkeyCurrency = mapCntCurrency.get('Turkey');

System.debug('India currency ' + IndiaCurrency);
System.debug('Turkey currency ' + TurkeyCurrency);

Set<String> countrySet = mapCntCurrency.keySet();
System.debug('Countries in map: ' + countrySet);

List<String> currencyList = mapCntCurrency.values();
System.debug('Currencies in map: ' + currencyList);

for(String country : countrySet ){
    System.debug(country);
    String eachCurrency = mapCntCurrency.get(country);
    System.debug(eachCurrency);
    
}


