import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'newProgsList', 'display', 'inputDegree', 'inputModifier', 'inputChordType', 'settingSetBass', 'inputDuration', 'inputScale', 'inputKey' ];

  get new_progressions_list() { return this.newProgsListTarget }
  get display() { return this.displayTarget }
  get degree() { return this.inputDegreeTarget }
  get modifier() { return this.inputModifierTarget }
  get chord_type() { return this.inputChordTypeTarget }
  get set_bass() { return this.settingSetBassTarget }
  get duration() { return this.inputDurationTarget }
  get scale() { return this.inputScaleTarget }
  get key() { return this.inputKeyTarget }

  add_progression_form(e) {
    // this.new_progressions_list.append()
  }

  show_targets() {
    console.log(this.new_progressions_list);
    console.log(this.display);
    console.log(this.degree);
    console.log(this.modifier);
    console.log(this.chord_type);
    console.log(this.set_bass);
    console.log(this.duration);
  }

  connect() {
    this.show_targets();
    // debugger;
    this.adjust_display();
  }

  on_degree_change(event) {
    this.adjust_display();
  }

  on_modifier_change(event) {
    this.adjust_display();
    this.adjust_degree_labels();
  }
  
  on_chordType_change(event) {
    this.adjust_display();
  }

  on_setBass_change(event) {
    // do directly
  }

  on_duration_change(event) {
    this.adjust_display();
  }

  async adjust_display() {
    const data = {
      // the selected radio button's value holds the degree
      "degree": document.querySelector('input[name="progression[degree]"]:checked').value, 
      "modifier": this.modifier.value,
      "chord_type": this.chord_type.value,
      "duration": this.duration.value,
      "scale": this.scale.value,
      "key": this.key.value,
    }
    const response = await fetch("/utils/print_progression_chord?degree=" + data.degree + "&modifier=" + data.modifier + "&chord=" + data.chord_type + "&duration=" + data.duration + "&scale=" + data.scale + "&key=" + data.key, {
      method: "GET",
      mode: "cors",
      credentials: "same-origin",
      headers: { "Content-Type": "application/json" },
    });

    console.log(response);
  }

  adjust_degree_labels() {

  }


}
