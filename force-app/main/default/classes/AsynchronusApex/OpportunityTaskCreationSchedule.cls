public with sharing class OpportunityTaskCreationSchedule implements Schedulable{

    public void execute(SchedulableContext sc){
        OpportunityTaskCreationBatch ob = new OpportunityTaskCreationBatch();
        Database.executeBatch(ob,20);
    }

}