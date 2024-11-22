import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = [ "rent", "history", "form" ]
  connect() {
  }

  form() {
    this.formTarget.classList.toggle("d-none");
  }

  history() {
    this.historyTarget.classList.toggle("d-none");
  }

  rent() {
    this.rentTarget.classList.toggle("d-none");
  }

}
