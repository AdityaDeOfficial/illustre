import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-manga-search"
export default class extends Controller {
  static targets = ["form", "results"]

  connect() {
    //console.log('hello world')
    //console.log("my results", this.resultsTarget)
    //console.log("my form", this.formTarget)
    //console.log("my controller", this.element)
  }
}
