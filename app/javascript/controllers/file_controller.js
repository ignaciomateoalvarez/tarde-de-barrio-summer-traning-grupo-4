import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["list"];

  connect() {
    this.listTarget.onchange = this.addFile;
  }

  addFile(event) {
    const files = event.target.files;
    this.listTarget.innerHTML = '';
    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      const listItem = document.createElement("li");
      listItem.innerHTML = `<span>${file.name}</span>`;
      this.listTarget.appendChild(listItem);
    }
  }
}
