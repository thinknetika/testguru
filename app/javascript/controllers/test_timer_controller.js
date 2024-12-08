import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["timer"];

    connect() {
        this.startedAtTimestamp = parseInt(this.data.get("startedAt")); //Сохраняем как timestamp
        console.log("Started at timestamp:", this.startedAtTimestamp);
        this.timeLimit = parseInt(this.data.get("timeLimitValue"));
        this.updateTimer();
        this.interval = setInterval(() => this.updateTimer(), 1000);
    }

    disconnect() {
        clearInterval(this.interval);
    }

    updateTimer() {
        const elapsedTime = Math.floor((Date.now() - this.startedAtTimestamp) / 1000);
        const remainingTime = this.timeLimit * 60 - elapsedTime;

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
        fetch('/test_passages/' + this.data.get('testPassageId') + '/time_out_finish', { method: 'POST' })
            .then(response => {
                if (!response.ok) {
                    console.error("HTTP error!", response.status);
                    return; // или обработайте ошибку по-другому
                }
                return response.json();
            })
            .then(data => {
                window.location.href = data.redirect_url;
            })
            .catch(error => console.error("Error:", error));
    }
}
