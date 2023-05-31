import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Import the rangePlugin from the flatpickr library
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime","date" ]
  connect() {
    flatpickr(this.dateTarget, {
              //  enableTime: true,
              mode : 'range',
              altInput: true,
              altFormat: "F j, Y",
              dateFormat: "Y-m-d",
            })
    // flatpickr(this.endTimeTarget, {})
  }
  setDates(event){
    const regex = /^(?<startdate>20\d\d-\d\d-\d\d).+(?<enddate>20\d\d-\d\d-\d\d)/
    const date = this.dateTarget.value.match(regex)
    console.log(regex.test(this.dateTarget.value))
    if (regex.test(this.dateTarget.value) == true) {
      console.log(this.startTimeTarget)
      this.startTimeTarget.value = date[1];
      this.endTimeTarget.value = date[2];
    }
  }
}
