import { LightningElement, track } from "lwc";

export default class TrackProperty extends LightningElement {
  @track contact = {
    name: "Steve Jobs",
    stay: "United States",
    company: "Apple"
  };

  handleChange(event) {
    this.contact.stay = event.target.value;
  }
}
