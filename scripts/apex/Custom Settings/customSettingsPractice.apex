Map<string, Country_Code__c> customSet = Country_Code__c.getAll();
System.debug('country codes are --> ' + customSet);
for(String s : customSet.keyset()){
    System.debug(s);
    System.debug('key ' + customSet.get(s));
    System.debug('value ' + customSet.get(s));
    System.debug('country code ' + customSet.get(s).Country_Code__c);
}