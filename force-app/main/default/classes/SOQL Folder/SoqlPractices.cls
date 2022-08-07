public class SoqlPractices {

    public static void testSOQL() {

        List<Account> lst = [SELECT Name FROM Account WHERE Industry = 'Education'];
        System.debug(lst);
        System.debug(lst.size());
        
    }
}