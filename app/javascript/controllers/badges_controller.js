import { Controller } from "@hotwired/stimulus";

export default class BadgesController extends Controller {
    static targets = ["options", "select"];

    connect() {
        this.selectTarget.addEventListener("change", this.update.bind(this));
        this.loadOptions();
    }

    update() {
        this.selectedBadgeType = this.selectTarget.value;
        this.fetchOptions(this.selectedBadgeType);
    }

    fetchOptions(badgeType) {
        if (badgeType) {
            fetch(`/admin/badges/options?badge_type=${badgeType}`)
                .then((response) => response.text())
                .then((html) => {
                    this.optionsTarget.innerHTML = html;
                })
                .catch((error) => {
                    console.error("Ошибка при получении данных:", error);
                });
        } else {
            this.optionsTarget.innerHTML = '';
        }
    }

    get selectTarget() {
        return this.element.querySelector("select[name='badge[rule_name]']");
    }

    loadOptions() {
        const selectedValue = this.selectTarget.value;
        if (selectedValue) {
            this.fetchOptions(selectedValue);
        }
    }
}
