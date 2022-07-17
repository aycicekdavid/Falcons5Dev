String sch = '0 30 13 * * ?';
AccountSchedulable accS = new AccountSchedulable();
System.schedule('Schedule account batch', sch, accS);