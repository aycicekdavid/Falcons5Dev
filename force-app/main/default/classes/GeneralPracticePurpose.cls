public class GeneralPracticePurpose { 

    // public static Boolean recursionHandle = false;

    public static List<User> practice1(List<Account> accL) {
        List<User> usrL = new List<User>();
        Set<Id> ownerIds = new Set<Id>();

        for(Account acc : accL){
            ownerIds.add(acc.OwnerId);
        }

        Map<Id,User> users = new Map<Id,User>([SELECT Id, FirstName, LastName from User WHERE Id IN: ownerIds]);

        for(Account acc : accL){
            User usr = users.get(acc.OwnerId);
            usrL.add(usr);
            System.debug('Account Name: ' + acc.Name + ' User First Name: ' + usr.FirstName);
        }
        
        return usrL;
        
    }

}

