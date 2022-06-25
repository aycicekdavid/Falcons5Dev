import { LightningElement } from 'lwc';

import CONTATCT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';

export default class RecordViewFormContact extends LightningElement {

    recordId = '0038c00002izhEHAAY';
    objectName = CONTATCT_OBJECT;
    fields = {
        title: TITLE_FIELD,
        firstName: FIRSTNAME_FIELD,
        lastName: LASTNAME_FIELD,
        email: EMAIL_FIELD,
        phone: PHONE_FIELD,
        department: DEPARTMENT_FIELD,
      };
}