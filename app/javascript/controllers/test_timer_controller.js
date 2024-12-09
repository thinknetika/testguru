import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["timer"];

    connect() {
        this.startedAtTimestamp = parseInt(this.data.get("startedAt"));
        this.timeLimit = parseInt(this.data.get("timeLimitValue")) * 60;
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
        const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
        clearInterval(this.interval);
        fetch(`/test_passages/${this.testPassageId}/time_out_finish`, {
            method: 'POST',
            headers: {
                'X-CSRF-Token': csrfToken,
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(data => window.location.href = data.redirect_url);
    }
}
