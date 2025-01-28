import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

export default class extends Controller {
    connect() {
        this.element.addEventListener('click', (e) => {
            const chordHelperForm = this.element.closest('form');

            // Inject the chord-specific data to the form
            const formData = new FormData(chordHelperForm);
            formData.append("pitch_ids", this.element.dataset.pitches);
            formData.append("progression_chord_id", this.element.dataset.progressionChordId);
            
            // Submit the form manually
            post(chordHelperForm.action, { responseKind: "turbo-stream", body: formData });
        })
    }
}