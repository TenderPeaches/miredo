import { Controller } from "@hotwired/stimulus"
import { post } from '@rails/request.js'

export default class extends Controller {
    connect() {
        this.element.addEventListener('click', (e) => {
            // Only send the request if the event was triggered from the <input type="checkbox">, otherwise a second event is caught by the <span class="slider"> element and triggers a duplicate request
            if (e.originalTarget.tagName == "INPUT") {
                // see InstrumentView#create for expected params
                post(this.element.dataset.url, { responseKind: "turbo-stream", body: JSON.stringify({
                    instrument: this.element.dataset.instrumentId,
                    fret_count: this.element.dataset.fretCount,
                    capo: this.element.dataset.capo,
                    pitch_ids: this.element.dataset.pitchIds,
                    capo_relative_pitches: this.element.querySelector('input').checked,
                    key: this.element.dataset.keyId,
                    scale: this.element.dataset.scaleId,
                    song: this.element.dataset.songId,
                })});
            }
        })
    }
}