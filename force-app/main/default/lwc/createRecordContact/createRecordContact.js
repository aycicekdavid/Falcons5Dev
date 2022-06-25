import { createRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class CreateRecordContact extends LightningElement {
    formdata = {};
    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    createContact() {
        const recordInput = {
            apiName : CONTACT_OBJECT.objectApiName,
            fields : this.formdata
        };
        
        createRecord(recordInput)
            .then(result => {
                console.log(result);
                this.template.querySelector('form.contactform').reset();
                this.formdata = {};
            })
            .catch(error => {
                console.error(error);
            })
    }
}