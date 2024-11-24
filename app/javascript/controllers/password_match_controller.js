import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["confirmation", "password"];

  connect() {
    this.confirmationTarget.addEventListener("input", this.checkMatch.bind(this));
  }

  checkMatch() {
    const password = this.passwordTarget.value;
    const confirmation = this.confirmationTarget.value;

    if (confirmation === "") {
      this.confirmationTarget.classList.remove("is-valid", "is-invalid");
    } else if (password === confirmation) {
      this.passwordTarget.classList.add("is-valid");
      this.passwordTarget.classList.remove("is-invalid");

      this.confirmationTarget.classList.add("is-valid");
      this.confirmationTarget.classList.remove("is-invalid");
    } else {
      this.confirmationTarget.classList.add("is-invalid");
      this.confirmationTarget.classList.remove("is-valid");
    }
  }
}
