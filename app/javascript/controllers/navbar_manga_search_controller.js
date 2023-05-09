import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-manga-search"
// Want 2 targets from search.html.erb (search bar form + all mangas iteration)
// form_with url: mangas_path, method: :get, class: "d-flex",form: {id: "search-form"},data: {action: "submit->navbar-manga-search#submit"}"
// div data-navbar-manga-search-target="results"
export default class extends Controller {
  static targets = ["search-form", "results"]

  connect() {
    //console.log('hello world?')
    //console.log("my results", this.resultsTarget)
    //console.log("my form", this.formTarget)
    //console.log("my controller", this.element)

    submit(event) {
      event.preventDefault();
      // our url for where fetch AJAX happening is action="/mangas"
      fetch(this.formTarget.action, {
        method: "GET",
        headers: { "Accept": "application/json" },
        body: new FormData(this.formTarget)
      })
      .then(response => response.json())
      .then((data) => {
        if (data.search_results) {
          // console.log(data)
          // console.log('user query',data.search_results)
          // console.log('blank',data.empty_form)

          // insert the user query
          this.itemsTarget.insertAdjacentHTML("beforeend", data.search_results);
        }
        this.formTarget.outerHTML = data.search;
      });
    }
  }
}
