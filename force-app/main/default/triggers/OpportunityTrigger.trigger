trigger OpportunityTrigger on Opportunity(before insert, after insert, before update, after update) {


  if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
   OpportunityTriggerHandler.updateOpportunityPoints(Trigger.new, Trigger.oldMap);
  }

  //==============================================================
  /*
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        OpportunityTriggerHandler.getTotalProductQty(Trigger.new);
      }
 */
  //==============================================================
  /*
    if((Trigger.isInsert || Trigger.isUpdate) && Trigger.isAfter){

        OpportunityTriggerHandler.debugMessage(Trigger.new);
    }
 */
  //==============================================================
  /*
    if(Trigger.isAfter && Trigger.isUpdate){

        OpportunityTriggerHandler.ifOppClosedWonCreateTask(Trigger.new);
    }
 */
  //==============================================================
  /*
    if(Trigger.isAfter && Trigger.isUpdate){

        OpportunityTriggerHandler.multiPicklistUpdate(Trigger.new, Trigger.oldMap);
    }
*/
  //===============================================================
  /*
    if(Trigger.isAfter && Trigger.isUpdate){

        OpportunityTriggerHandler.createTaskOpp(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
 */
  //===============================================================
  /*
    if(Trigger.isAfter && Trigger.isUpdate){

    OpportunityTriggerHandler.opportunityUpdate(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
   }
 */
  //===============================================================
  /*
 if(Trigger.isAfter && Trigger.isUpdate){
    OpportunityTriggerHandler.oldAndNewAmountInOnLine(Trigger.oldMap, Trigger.new);
}
 */
}
