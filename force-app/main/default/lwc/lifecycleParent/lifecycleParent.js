import { LightningElement } from 'lwc';

export default class LifecycleParent extends LightningElement {
    constructor() {
        super();
        console.log("Parent constructor called");
    }
    connectedCallback() {
        console.log("Parent connectedCallback called");
    }
    renderedCallback() {
        console.log("Parent renderedCallback called");
    }
    disconnectedCallback() {
        console.log("Parent disconnectedCallback called");
    }

    input;
    changeHandler(event) {
        this.input = event.target.value;
    }
    showChild = true;
    childHandler() {
        this.showChild = false;
    }
}