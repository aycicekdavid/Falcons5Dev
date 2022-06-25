import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';


export default class RecordFormOpportunity extends LightningElement {

   
    objectName = OPPORTUNITY_OBJECT;


    
    showSuccessMsg(){
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "The account record has been saved successfully!",
            variant:"success"
        });
        this.dispatchEvent(successToast);
    }



}