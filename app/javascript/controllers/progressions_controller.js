import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'newProgsList' ];

  get new_progressions_list() { return this.newProgsListTarget; }

  add_progression_form(e) {
    this.new_progressions_list.append()
  }
}
