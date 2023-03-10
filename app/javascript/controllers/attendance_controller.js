import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String, type: String };

  connect() {
  }

  submit(method, body) {
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    return fetch(this.urlValue + "?attendance=" + this.typeValue, {
      method: method,
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json",
      },
      body: body,
    });
  }

  changeAttendance() {
    this.submit("PUT", "");
  }
}
