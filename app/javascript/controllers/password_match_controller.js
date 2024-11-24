import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["confirmation", "password"];

  connect() {
    this.confirmationTarget.addEventListener("input", this.checkMatch.bind(this));
    this.passwordTarget.addEventListener("input", this.checkMatch.bind(this));
    this.confirmationTarget.addEventListener("click", this.checkMatch.bind(this));
    this.passwordTarget.addEventListener("click", this.checkMatch.bind(this));
  }

  checkMatch() {
    const password = this.passwordTarget.value;
    const confirmation = this.confirmationTarget.value;

    if (confirmation !== password || confirmation === "" || password === "") {
      this.confirmationTarget.classList.remove("is-valid");
      this.confirmationTarget.classList.add("is-invalid");

      this.passwordTarget.classList.remove("is-valid");
      this.passwordTarget.classList.add("is-invalid");
    }
    else {
      this.confirmationTarget.classList.remove("is-invalid");
      this.confirmationTarget.classList.add("is-valid");

      this.passwordTarget.classList.remove("is-invalid");
      this.passwordTarget.classList.add("is-valid");
    }
  }
}
