public with sharing class OpportunityTaskCreationBatch implements Database.Batchable<SObject>{

    // Write a logic to create tasks for all the opporrtunities other than the closed won or closed lost and on which there was no activity since last 7 days.
    // Subject = Other
    // Due Date = Today, if Opportunity close date is already passed; otherwise Opportunity Close Date -2 days
    // Comments = Reminder - Please act on the Opportunity
    // Related To = Opportunity Id
    // Assigned To = Opportunity Owner Id
    // Status = In Prugress

    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q = Database.getQueryLocator([select id, OwnerId, CloseDate from Opportunity where LastModifiedDate < LAST_N_DAYS:7 and (Stagename != 'Closed Won' and stagename != 'Closed Lost')]);
        return q;
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> scope){
        //create task
        List<Task> taskList = new List<Task>();

        for(Opportunity opp : scope){
            Task tk = new Task();
            tk.Subject = System.Label.TaskSubject; //This needs to be created in the Org first.
            tk.Description = System.Label.TaskDescription; //This needs to be created in the Org first.
            tk.WhatId = opp.id;
            tk.OwnerId = opp.OwnerId;
            tk.Status = 'In Progress';
            
            if(opp.CloseDate < Date.today()){
                tk.ActivityDate = Date.today();
            }else{
                tk.ActivityDate = opp.CloseDate.addDays(-2);
            }
            taskList.add(tk);
        }

        if(!taskList.isEmpty()){
            insert taskList;
        }
    }

    public void finish(Database.BatchableContext bc){

    }  
}