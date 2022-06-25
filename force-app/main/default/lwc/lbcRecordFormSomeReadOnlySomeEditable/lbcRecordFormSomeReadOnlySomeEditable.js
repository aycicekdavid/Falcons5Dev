import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CASE_OBJECT from '@salesforce/schema/Case';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId'; //Read only
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId'; //Read only
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class LbcRecordFormSomeReadOnlySomeEditable extends LightningElement {

    recordId="5008c00001GfCAPAA3";
    objectName=CASE_OBJECT;
    fields={
        account:ACCOUNT_FIELD,
        contact:CONTACT_FIELD,
        subject:SUBJECT_FIELD,
        priority:PRIORITY_FIELD,
        status:STATUS_FIELD,
        description:DESCRIPTION_FIELD,
        origin:ORIGIN_FIELD};

    showSuccessMsg(){
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "The account record has been saved successfully!",
            variant:"success"
        });
        this.dispatchEvent(successToast);
    }
}