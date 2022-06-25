import { LightningElement,track } from 'lwc';

export default class ParentLwcComp extends LightningElement {
    @track parentValue = 100;
    handleChild(){
        // eslint-disable-next-line eqeqeq
        if(this.parentValue == 100)
            this.parentValue = 200;
        else
            this.parentValue = 100;
    }
}