import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random"
export default class extends Controller {
  connect() {
    console.log("Hiii")
  }
}
