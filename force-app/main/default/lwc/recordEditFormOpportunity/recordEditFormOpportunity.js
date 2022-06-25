import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import ACCOUNTID_FIELD from '@salesforce/schema/Opportunity.AccountId';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class RecordEditFormOpportunity extends LightningElement {

    recordId = '0068c00000nkZ8eAAE';
    showContent = true;
    objectName = OPPORTUNITY_OBJECT;
    fields = {
        name:NAME_FIELD,
        stage:STAGE_FIELD,
        accountId:ACCOUNTID_FIELD,
        amount:AMOUNT_FIELD,
        closeDate:CLOSEDATE_FIELD
    };

    successHandler() {
        const successToast = new ShowToastEvent({
            title : "Success",
            message : "Opportunity has been created successfully",
            variant : "success"
        });
        this.dispatchEvent(successToast);
    }



}