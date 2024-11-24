import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["errors"];
    ascending = true;

    handleEditClick() {
        this.element.addEventListener('click', (event) => {
            if (event.target.classList.contains('form-inline-link')) {
                event.preventDefault();
                const testId = event.target.dataset.testId;
                this.editTest(testId);
            }
        });
    }

    editTest(testId) {
        const titleElement = this.element.querySelector(`tr[data-test-id="${testId}"] td > span.test-title`);
        const formElement = this.element.querySelector(`tr[data-test-id="${testId}"] td > div.form-inline`);
        const linkElement = this.element.querySelector(`tr[data-test-id="${testId}"] td > a.form-inline-link`);

        if (titleElement) {
            titleElement.classList.toggle('d-none');
        }

        if (formElement) {
            formElement.classList.toggle('d-none');
        }

        if (linkElement) {
            linkElement.textContent = 'Cancel'
        }
    }

    parseErrors() {
        const errorContainer = this.errorsTarget;
        if (errorContainer) {
            const resourceErrorsElement = errorContainer.querySelector('.resource-errors');
            if (resourceErrorsElement) {
                const resourceId = resourceErrorsElement.dataset.resourceId;
                if (resourceId) {
                    this.editTest(resourceId);
                }
            }
        }
    }

    connect() {
        this.parseErrors();
        this.handleEditClick();
    }
}