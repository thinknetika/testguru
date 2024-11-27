import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["progressBar"];

    connect() {
        this.updateProgressBar();
    }

    updateProgressBar() {
        const progressBar = this.progressBarTarget;
        const progressValue = progressBar.dataset.progress;

        if (progressValue !== undefined) {
            let percentage = parseInt(progressValue, 10);

            progressBar.querySelector(".progress-bar").style.width = `${percentage}%`;
            progressBar.querySelector(".progress-bar").setAttribute("aria-valuenow", percentage);
            document.getElementById("progressbarLabel").textContent = `Прогресс: ${percentage}%`;
        }
    }
}
