Students sumit = new Students();
sumit.firstName = 'Sumit';
sumit.lastName = 'Verma';
sumit.year = 2016;
sumit.major = 'Electrical';
String majorValForSumit = sumit.generateReport();
//Report Generated for Sumit Verma of 2016
System.debug('Major '+majorValForSumit);
//Major Electrical
System.debug('sumit    '+sumit);
//sumit    Students:[firstName=Sumit, lastName=Verma, major=Electrical, year=2016]

Students apurv = new Students();
apurv.firstName = 'Apurv';
apurv.lastName = 'Agrawal';
apurv.year = 2017;
apurv.major = 'Electronics';
String majorValForApurv = apurv.generateReport();
System.debug('Major '+majorValForApurv);
System.debug('apurv    '+apurv);