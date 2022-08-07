import { LightningElement } from 'lwc';

export default class MyNameAndRole extends LightningElement {

username;
role;

handleChange(username){
    this.username = username.target.value;
}

get roles(){
    return[
        {label: 'Salesforce Admin', value: 'Salesforce Admin'},
        {label: 'Salesforce Developer', value: 'Salesforce Developer'},
        {label: 'Salesforce Architect', value: 'Salesforce Architect'},
    ];
}

handleChange2(role){
    this.role = role.detail.value;
}

}