import { LightningElement } from "lwc";

export default class HelloWorld extends LightningElement {
  name = "Salesforce Devel";
  experience = 25;
  fruits = ["Apple", "Orange", "Pineapple"];
  experiences = [3, 4, 55, 33, 1];
  location = {
    city: "Adana",
    country: "USA",
    postalCode: "34095"
  };
}