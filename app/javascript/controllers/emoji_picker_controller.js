import { Controller } from "@hotwired/stimulus";
import { createPopup } from "https://unpkg.com/@picmo/popup-picker@latest/dist/index.js?module";

export default class extends Controller {
  static targets = ["button", "input"];

  connect() {
    this.picker = createPopup(
      { 
        hideOnEmojiSelect: false,
        hideOnClickOutside: false,
    },
      {
        referenceElement: this.buttonTarget,
        triggerElement: this.buttonTarget,
        position: 'bottom-start'
      }
    );
    this.picker.addEventListener('emoji:select', selection => {
      const arr = this.inputTarget.value.split("");
      arr.splice(this.inputTarget.selectionStart,0,selection.emoji);
      this.inputTarget.value = arr.join("");

    });
  }

  toggle() {
    this.picker.toggle();
  }
}
