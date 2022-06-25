import { LightningElement } from 'lwc';

export default class QuerySelectors extends LightningElement {
    fruits = ["Apple", "Orange","Banana"];
    clickHandler(){
        //1 element
        const elem = this.template.querySelector('h1');
        console.log(elem.innerText);
        elem.style.border = '2px solid green';
        elem.style.backgroundColor = 'yellow';
        

        //Multiple element
        const fruitElems = this.template.querySelectorAll('.fruit');
        fruitElems.forEach(item => {
            console.log(item.innerText);
            item.setAttribute('class','slds-align_absolute-center');
        })
    }
}