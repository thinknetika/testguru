import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["timer", "submitButton"];

    connect() {
        const timeLimitValue = parseFloat(this.data.get("timeLimitValue"));

        if (isNaN(timeLimitValue)) {
            console.warn("Invalid time limit value.  Not initializing timer.");
            return;
        }

        if (timeLimitValue <= 0) {
            this.timerTarget.textContent = "∞";
            this.timerTarget.classList.add("infinity-large");
            return;
        }

        this.startedAtTimestamp = parseInt(this.data.get("startedAt"));
        this.timeLimit = timeLimitValue * 60;
        this.testPassageId = this.data.get("testPassageId");
        this.updateTimer();
        this.interval = setInterval(() => this.updateTimer(), 1000);
    }

    disconnect() {
        clearInterval(this.interval);
    }

    updateTimer() {
        const elapsedTime = Math.floor((Date.now() - this.startedAtTimestamp) / 1000);
        const remainingTime = this.timeLimit - elapsedTime;

        if (remainingTime <= 0) {
            this.timeUp();
        } else {
            const minutes = Math.floor(remainingTime / 60);
            const seconds = remainingTime % 60;
            this.timerTarget.textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds} мин`;
        }
    }

    timeUp() {
        clearInterval(this.interval);
        this.timerTarget.textContent = "0:00 мин";
        this.timerTarget.classList.add("text-danger", "fw-bold");
        this.submitButtonTarget.textContent = "Завершить";
        this.submitButtonTarget.classList.add("btn-danger");
        this.submitButtonTarget.closest('form').setAttribute('disabled', 'disabled');
    }
}
