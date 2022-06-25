import { LightningElement, wire } from 'lwc';
import getAccountsByType from '@salesforce/apex/AccountController.getAccountsByType';

const COLUMNS = [
    {label:"Account Name", fieldName: "Name", type: "text"},
    {label:"Account Type", fieldName: "Type", type: "text"},
    {label:"Industry", fieldName: "Industry", type: "text"},
    {label:"Annual Revenue", fieldName: "AnnualRevenue", type: "currency"},
];

export default class GetAccountsWithType extends LightningElement {

    accType = 'Prospect';
    @wire(getAccountsByType, {type: '$accType'})
    accounts;
    columns = COLUMNS;
}