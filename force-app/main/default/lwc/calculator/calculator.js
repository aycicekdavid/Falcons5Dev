import { LightningElement } from "lwc";

export default class Calculator extends LightningElement {
  num1 = 0;
  num2 = 0;
  total = 0;

  handleChange(event) {
    var compare = event.target.name;

    if (compare === "Input1") {
      this.num1 = event.target.value;
    } else {
      this.num2 = event.target.value;
    }
    this.total = Number(this.num1) + Number(this.num2);
  }
}
