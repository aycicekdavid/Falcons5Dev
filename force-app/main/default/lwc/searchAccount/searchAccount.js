import { LightningElement } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountController.searchAccounts';

export default class SearchAccount extends LightningElement {
    searchWord;
    accounts;
    error;

    searchHandler(event){

        this.searchWord = event.target.value;
        if(this.searchWord.length > 1){
            searchAccounts({searchKey: this.searchWord})

            .then(result => {
                console.log(result);
                this.accounts = result;
            })
            .catch(error => {
                console.error(error);
                this.error = error;
            })
        }else{
            this.accounts = undefined;
            this.error = undefined;
        }

    }
}