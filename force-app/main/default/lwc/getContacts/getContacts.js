import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';

const COLUMNS = [
    {label:"First Name", fieldName: "FirstName", type: "text"},
    {label:"Last Name", fieldName: "LastName", type: "text"},
    {label:"Title", fieldName: "Title", type: "text"},
    {label:"Email", fieldName: "Email", type: "email"},
    {label:"Mobile Phone", fieldName: "MobilePhone", type: "phone"}
];

export default class GetAccounts extends LightningElement {
    columns = COLUMNS;

    @wire(getContacts)
    contacts;

}