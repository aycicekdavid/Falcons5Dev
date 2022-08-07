import { LightningElement } from "lwc";

export default class HelloWorld extends LightningElement {
  name = "Salesforce Developer";
  experience = 25;
  fruits = ["Apple", "Orange", "Pineapple"];
  experiences = [3, 4, 55, 33, 1];
  location = {
    city: "Chicago",
    country: "USA",
    postalCode: "34095"
  };
}