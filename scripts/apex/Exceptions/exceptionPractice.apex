Account acc = new Account();
insert acc;

//will line 5 execute?
System.debug('Apex is SIMPLE');

//Line 5 will not execut. DML Exception will occur because reaquired field is missing.

try {
  Account acc = new Account();
  insert acc;
} catch (Exception Ex) {
    System.debug('Something went wrong!');
    //System.debug(Ex);
}

//will Line 9 execute? Yes, it will.
System.debug('Apex is SIMPLE!');