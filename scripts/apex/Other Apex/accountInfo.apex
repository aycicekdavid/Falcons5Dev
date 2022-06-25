AccountHolderInfo objectAccount1 = new AccountHolderInfo('Jimmy', '123123123123123', '9898989898', 'jimmy@mail.com');
AccountHolderInfo objectAccount2 = new AccountHolderInfo('James', '321321321321321', '7878787878', 'james@mail.com');
AccountHolderInfo objectAccount3 = new AccountHolderInfo('Karl', '456456456456456', '7676767676', 'karl@mail.com');

Map<String, AccountHolderInfo> mapOfAccount = new Map<String, AccountHolderInfo>();
mapOfAccount.put(objectAccount1.accountNumber, objectAccount1);
mapOfAccount.put(objectAccount2.accountNumber, objectAccount2);
mapOfAccount.put(objectAccount3.accountNumber, objectAccount3);

AccountInfo objAccountInfo = new AccountInfo(mapOfAccount);
objAccountInfo.showAccountInfo('123412352152');

