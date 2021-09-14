import { Controller } from "stimulus"

export default class extends Controller {
static targets = ["entries"];
scroll() {
  console.log(window.pageYOffset)
}
}
