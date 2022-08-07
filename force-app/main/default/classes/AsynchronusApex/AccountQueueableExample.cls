public with sharing class AccountQueueableExample implements Queueable {
    public List<Account> accList;
    //parameterized cunstructor
    public AccountQueueableExample(List<Account> accList){
        this.accList = accList;
    }

    public void execute(QueueableContext context){
        //Even it's not in requirement, we can write debug statements to see what's happening in our code.
        System.debug('reached in execute method.');
        System.debug('accList :' + accList);
        for(Account acc : accList){
            //Update the Account name
            acc.Name += '--SI';
        }
        update accList;
    }
}