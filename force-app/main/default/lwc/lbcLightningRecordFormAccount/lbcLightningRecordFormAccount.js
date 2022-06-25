import { LightningElement } from 'lwc';
//For showing success message, import the class from the library
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

//To create LBC for account object, first we need to import object.
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
//Import the fields we need to show to the user
import NAME_FIELD from "@salesforce/schema/Account.Name";
import TYPE_FIELD from "@salesforce/schema/Account.Type";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import REVENUE_FIELD from "@salesforce/schema/Account.AnnualRevenue";
import ACC_NUM_FIELD from "@salesforce/schema/Account.AccountNumber";
import RATING_FIELD from "@salesforce/schema/Account.Rating";

//In the class declare and intialize the variables
export default class LbcLightningRecordFormAccount extends LightningElement {

    //Initialize the record Id with a record Id from the org
    recordId = '0018c00002BAry3AAD';
    //Intialize the object and the fields
    objectName = ACCOUNT_OBJECT;
    fields = [NAME_FIELD,TYPE_FIELD,INDUSTRY_FIELD,REVENUE_FIELD,ACC_NUM_FIELD,RATING_FIELD];

    //To s how a success message, create a method
    showSuccessMsg(){
        //Create an Object from ShowToastEvent class and give the intitial value for it.
        const successToast = new ShowToastEvent({
        title : "Success",
        message : "The account record has been saved successfully!",
        variant : "success"
    })
    this.dispatchEvent(successToast);
    }
}