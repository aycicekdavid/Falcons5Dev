// List<Integer> lst = new List<Integer>();
// ApexHoursPractices.evenNumbers(lst);

// Opportunity opp = new Opportunity(
//   Name = 'New Opportunity for Apex Hours2',
//   CloseDate = Date.today(),
//   Amount = 200000,
//   StageName = 'Prospecting',
//   AccountId = '0018c00002BAry5AAD'
// );
// insert opp;

// Account acc = [SELECT id, name FROM Account WHERE name = 'University of Arizona copied from account copied from account'];
// acc.name = 'University of Arizona';
// System.debug(acc);
// update.acc;

// Utilities.oppList('T', ' copied');


// Define a new map
Map<string, string> ProductCodeToProductName = new Map<string, string>();

// Insert a new key-value pair in the map where '1002' is key and 'Acetone' is value
ProductCodeToProductName.put('1002', 'Acetone');

// Insert a new key-value pair in the map where '1003' is key and 'Ketone' is value
ProductCodeToProductName.put('1003', 'Ketone');

// Assert that the map contains a specified key and respective value
System.assert(ProductCodeToProductName.containsKey('1002'));
System.debug('If output is true then Map contains the key and output is:'
   + ProductCodeToProductName.containsKey('1002'));

// Retrieves a value, given a particular key
String value = ProductCodeToProductName.get('1002');
System.debug('Value at the Specified key using get function: '+value);

// Return a set that contains all of the keys in the map
Set <String> SetOfKeys = ProductCodeToProductName.keySet();
System.debug('Value of Set with Keys '+SetOfKeys);
