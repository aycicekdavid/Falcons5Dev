import { LightningElement } from 'lwc';

export default class ChildModal extends LightningElement {
    clickHandler(){
        //create an event named 'close' and send it.
        const closeEvent = new CustomEvent('close',{bubbles:true});
        this.dispatchEvent(closeEvent);
        console.log("close event has been created and sent with bubbles option");
    }
    topDivHandler(){
        console.log("dev handler which is a step up to button has been called");

    }

    divHandler(){
        console.log("dev handler which is 2 step up to button has been called");

    }
}