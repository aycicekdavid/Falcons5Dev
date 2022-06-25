import { LightningElement,api,track } from 'lwc';

export default class ChildAddContactNameComp extends LightningElement {
    @track lstOfContacts = ["Ismail","Tahir","Esma","AY"];
    @api addContact(studentName){
        this.lstOfContacts.push(studentName);
    }
}