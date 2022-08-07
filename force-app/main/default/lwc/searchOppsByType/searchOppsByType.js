import { LightningElement } from 'lwc';
import getOppsByType from '@salesforce/apex/OpportunityController.getOppsByType';

export default class SearchOppsByType extends LightningElement {

    selecedtType;
    opps;
    error;

    changeHandler(event){
        this.selecedtType = event.target.value;
        getOppsByType({type: this.selecedtType})
        .then(result => {
            this.opps = result;
        })

        .catch(error => {
            this.error = error;
        })
    }


    get typeOptions(){
        return [
            {label:"Existing Customer - Upgrade" , value:"Existing Customer - Upgrade"},
            {label:"Existing Customer - Replacement" , value:"Existing Customer - Replacement"},
            {label:"Existing Customer - Downgrade" , value:"Existing Customer - Downgrade" },
            {label:"New Customer" , value:"New Customer"}
        ]
    }
}