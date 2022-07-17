Account acc = new Account();
insert acc;

//will line 5 execute?
System.debug('Apex is SIMPLE');

//Line 5 will not execut. DML Exception will occur because reaquired field is missing.

//============================

try {
  Account acc = new Account();
  insert acc;

} catch (Exception Ex) {
    System.debug('Something went wrong!');
    //System.debug(Ex);
}

//will Line 9 execute? Yes, it will.
System.debug('Apex is SIMPLE!');


//=============================
//Since we already catched at the 1st catch statement, it'll not go to the generic one.

try {
  Account acc = new Account();
  insert acc;

} catch(DmlException e){
    System.debug('Something went wrong!');

}catch (Exception Ex) {
    System.debug(Ex);
}

//will Line 9 execute? Yes, it will.
System.debug('Apex is SIMPLE!');

//=============================
//FINALLY BLOCK

try {
  Account acc = new Account();
  insert acc;

} catch(Exception e){
    System.debug('Something went wrong!');

}
// catch (DmlException e) {
//     System.debug(e);
//     //this will not even run and Apex will not allow us to write it here because of the generic one is already run before this one.
// } 

finally {
    System.debug('This will always run.');
}

System.debug('Apex is SIMPLE!');
