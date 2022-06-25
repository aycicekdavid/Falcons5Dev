import { createRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import LEAD_OBJECT from '@salesforce/schema/Lead';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordLead extends LightningElement {
    formdata = {};
    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    createLead() {
        const recordInput = {
            apiName : LEAD_OBJECT.objectApiName,
            fields : this.formdata
        };
        
        createRecord(recordInput)
            .then(result => {
                console.log(result);
                this.template.querySelector('form.leadform').reset();
                this.formdata = {};
                this.createToast("Success", "Record has been updated successfully", "success");
            })
            .catch(error => {
                console.error(error);
                this.createToast("Error", "Error occured while creating the record", "error");
            })
    
    }
    createToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}