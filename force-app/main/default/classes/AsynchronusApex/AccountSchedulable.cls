//implement Schedulable interface
public class AccountSchedulable implements Schedulable{

    //mandatory method to implement
    public void execute(SchedulableContext sc){

        //In this example we are just starting new batch class.
        //this Apex, you can write here any Apex code.

        //start a new batch execution.

        // AccountBatch ab = new AccountBatch();
        // Database.executeBatch(ab);

        //or we can directly write like below
        Database.executeBatch(new AccountBatch());
    }
}
