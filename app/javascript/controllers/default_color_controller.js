// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input"]
  static values = {color: String}
  connect() {
    console.log("Default color");
  }

  setValue(e) {
    e.preventDefault()
    // set value of input (this.inputTarget) to the default color (this.colorValue)
    console.log('setValue')
    this.inputTarget.value = this.colorValue
  }
}
