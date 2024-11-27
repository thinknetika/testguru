import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["questionHeader", "arrowUp", "arrowDown"];
    ascending = true;

    sortTable() {
        const tableBody = this.element.querySelector('tbody');
        if (!tableBody) return;

        const rows = Array.from(tableBody.querySelectorAll('tr'));
        rows.sort((a, b) => {
            const aQuestion = a.cells[0].textContent.trim().toLowerCase() || "";
            const bQuestion = b.cells[0].textContent.trim().toLowerCase() || "";
            return this.ascending ? aQuestion.localeCompare(bQuestion) : bQuestion.localeCompare(aQuestion);
        });

        const fragment = document.createDocumentFragment();
        rows.forEach(row => fragment.appendChild(row));
        tableBody.replaceChildren(fragment);

        this.swapIcons();
        this.ascending = !this.ascending;
    }

    swapIcons() {
        this.arrowUpTarget.classList.toggle('d-none');
        this.arrowDownTarget.classList.toggle('d-none');
    }

    connect() {
        this.questionHeaderTarget.addEventListener('click', () => this.sortTable());
    }
}
