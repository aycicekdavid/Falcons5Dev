// 1. Create a Map named zipCodeToCityMap which should contain the Zipcode to City Name mapping. Like below:
// a. 100101 => New Delhi
// b. 101234 => Mumbai
// c. 569023 => New York City
// 2. Add multiple mappings of your choice in the zipCodeToCityMap Map.
Map<String,String> zipCodeToCityMap = new Map<String,String>();
zipCodeToCityMap.put('10010', 'Atlanta');
zipCodeToCityMap.put('20010', 'Chicago');
zipCodeToCityMap.put('30010', 'Arlington');
zipCodeToCityMap.put('40010', 'Austin');
zipCodeToCityMap.put('50010', 'Los Angeles');
zipCodeToCityMap.put('204101', 'New York');

System.debug(zipCodeToCityMap);

// 3. Check if the above map contains mapping for 204101.

System.debug('is Map contains 204101 ' + zipCodeToCityMap.containsKey('204101'));

// 4. Print all the Zip Codes present in the zipCodeToCityMap.

System.debug(zipCodeToCityMap.keySet());

// 5. Print all the city names present in the zipCodeToCityMap.

System.debug(zipCodeToCityMap.values());

// 6. Print the number of mappings present in the zipCodeToCityMap.

System.debug('Total number of mapping ' + zipCodeToCityMap.size());

// 7. Create a set as uniqueZipCodeSet and populate it with all the Zip codes from zipCodeToCityMap.

Set<String> uniqueZipCodeSet = zipCodeToCityMap.keySet();
System.debug('uniqueZipCodeSet ' + uniqueZipCodeSet);

// 8. Create a List as cityNameList and populate it with all the city names from zipCodeToCityMap.

List<String> cityNameList = zipCodeToCityMap.values();
System.debug('cityNameList ' + zipCodeToCityMap.values());

// 9. Check if the zipCodeToCityMap is Empty.

System.debug('iszipCodeToCityMapEmpty ' + zipCodeToCityMap.isEmpty());

// 10. List down the differences between list and Map
/*
- List accepts duplicates, Map accepts duplicates only in value part but keys must be unique.
- List accepts only values, Map accepts keys and values.
- Syntax is different
- There is order in List but Map doesn't have order.
- We can reach the values via Index, but in Map we can reach the values via keys.
- List can take a data type like String, Integer, etc. , but in Map key part can take only primitive, however value part can take any type.
*/

