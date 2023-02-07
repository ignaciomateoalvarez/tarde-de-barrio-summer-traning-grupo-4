import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
  }
  toggleBackground(){
    document.getElementById('modal-background').hidden=false
  }
}
