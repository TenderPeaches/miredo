import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
    static targets = [ "toggle" ]

    connect() {
        this.listen();
    }

    listen() {
        this.toggleTarget.addEventListener('change', (e) => {
            get(this.element.dataset.url + "?toggled=" + this.toggleTarget.checked)
        });
    }
}