import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["hideButton"];

  hideModal() {
    this.hideButtonTarget.classList.toggle("hidden");
  }
}
