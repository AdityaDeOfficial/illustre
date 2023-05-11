import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-manga-search"
// Want 2 targets from search.html.erb (search bar form + all mangas iteration)
// form_with url: mangas_path, method: :get, class: "d-flex",form: {id: "search-form"},data: {action: "submit->navbar-manga-search#submit"}"
// div data-navbar-manga-search-target="results"
export default class extends Controller {
  static targets = ["results", "form"]

  connect() {
    // console.log('hello world?')
    // console.log("my results", this.resultsTarget)
    //console.log("my form", this.formTarget)
    //console.log("my controller", this.element)
  }

  showResults(event) {
    this.resultsTarget.classList.remove('d-none')
  }

  hideResults(event) {
    this.resultsTarget.classList.add('d-none')
  }

  submitForm(event) {
    this.formTarget.submit()
  }
}
