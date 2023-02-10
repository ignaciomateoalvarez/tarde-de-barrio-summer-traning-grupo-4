import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static values = {url:String}
  connect() {
  }

  submit(method, body) {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    return fetch(this.urlValue, {
      method: method,
      headers: {
      "X-CSRF-Token": csrfToken, 
      "Content-Type": "application/json"
    },
    body: body
   } )
  }

  userActivate() {
    this.submit('PUT', '') 
  }

}

