import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["hideButton","burgerMenu"];

  hideModal() {
    this.hideButtonTarget.classList.toggle("hidden");
  }

  toggleMenu(){
    this.burgerMenuTarget.classList.toggle('hidden')
  }
}
