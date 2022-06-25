import { updateRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class UpdateRecordCase extends LightningElement {
    formdata = {};
    recordId ='5008c00001GfCAPAA3';
    changeHandler(event){
        this.formdata['Id'] = this.recordId;
        const{name, value} = event.target;
        this.formdata[name] = value;
    }

    updateCase(){
        const recordInput = {fields: this.formdata};

        updateRecord(recordInput)
        .then(result => {
            console.log(result);
            this.createToast("Success", "Case has been updated successfully", "success");
        })
        .catch(error => {
            console.error(error);
            this.createToast("Error", "Error occured while updating the case", "error");
        })
    }

    createToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}