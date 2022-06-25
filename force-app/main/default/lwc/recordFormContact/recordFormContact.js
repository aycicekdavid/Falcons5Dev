import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTATCT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';

export default class RecordFormContact extends LightningElement {

    recordId = '0038c00002izhEHAAY';
    objectName = CONTATCT_OBJECT;
    fields = [ACCOUNTID_FIELD,TITLE_FIELD,FIRSTNAME_FIELD, LASTNAME_FIELD,EMAIL_FIELD, PHONE_FIELD, DEPARTMENT_FIELD];
    
    showSuccessMsg(){
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "The account record has been saved successfully!",
            variant:"success"
        });
        this.dispatchEvent(successToast);
    }
}