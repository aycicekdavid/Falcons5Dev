import { LightningElement } from 'lwc';

export default class Allowances extends LightningElement {

    payments = [
        {
            id : 1,
            type : "Internet allowance",
            amount : 100.00,
            paid : true
        },
        {
            id : 2,
            type : "Work from home allowance",
            amount : 5000.00,
            paid : false
        },
        {
            id : 3,
            type : "Well being allowance",
            amount : 10000.00,
            paid : true
        }
    ];

}