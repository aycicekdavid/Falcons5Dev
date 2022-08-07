import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {

    names = ["Ali", "Ahmet", "Veli"];

    get firstname() {
        return this.names[1];
    }
    
    num1 = 20;
    num2 = 30;

    get multiplyNums(){//var, let, const
        var mul = this.num1*this.num2;
        return mul;
    }

    num3 = "20";
    num4 = "30";

    get sumOfNums(){

        return Number(this.num3)+Number(this.num4);
    }

}