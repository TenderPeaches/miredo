import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'newProgsList', 'display', 'inputDegree', 'inputModifier', 'inputChordType', 'settingSetBass', 'inputDuration', 'inputScale', 'inputKey', 'inputBassDegree', 'inputBassModifier', 'bassControls' ];

  get new_progressions_list() { return this.newProgsListTarget }
  get display() { return this.displayTarget }
  get degree() { return this.inputDegreeTarget }
  // shortcut for radio button group inputs value
  get degree_value() { return document.querySelector('input[name="progression[degree]"]:checked').value }
  get modifier() { return this.inputModifierTarget }
  get bass_degree() { return this.inputBassDegreeTarget }
  get bass_degree_value() { return document.querySelector('input[name="progression[bass_degree]"]:checked')?.value }
  get bass_modifier() { return this.inputBassModifierTarget }
  get chord_type() { return this.inputChordTypeTarget }
  get set_bass() { return this.settingSetBassTarget }
  get duration() { return this.inputDurationTarget }
  get scale() { return this.inputScaleTarget }
  get key() { return this.inputKeyTarget }
  get bass_controls() { return this.bassControlsTarget }

  add_progression_form(e) {
    // this.new_progressions_list.append()
  }

  show_targets() {
    console.log(this.new_progressions_list);
    console.log(this.display);
    console.log(this.degree);
    console.log(this.bass_degree);
    console.log(this.modifier);
    console.log(this.bass_modifier);
    console.log(this.chord_type);
    console.log(this.set_bass);
    console.log(this.duration);
  }

  // on page load
  connect() {
    this.show_targets(); // for debug
    this.adjust_display();
  }

  on_degree_change(event) {
    this.adjust_display();
  }

  on_bassDegree_change(event) {
    this.adjust_display();
  }

  on_modifier_change(event) {
    this.adjust_display();
    this.adjust_degree_labels();
  }

  on_bassModifier_change(event) {
    this.adjust_display();
    this.adjust_bassDegree_labels();
  }
  
  on_chordType_change(event) {
    this.adjust_display();
  }

  on_setBass_change(event) {
    // If user activated bass
    if (event.target.checked) {
      // Show the bass-specific controls
      this.bass_controls.classList.remove('hidden');
    }
    // Else, user disabled bass
    else {
      // Hide the bass-specific control
      this.bass_controls.classList.add('hidden');
    }
  }

  on_duration_change(event) {
    this.adjust_display();
  }

  async adjust_display() {
    const data = {
      // the selected radio button's value holds the degree
      "degree": this.degree_value, 
      "modifier": this.modifier.value,
      "chord_type": this.chord_type.value,
      "duration": this.duration.value,
      "scale": this.scale.value,
      "key": this.key.value,
      "bass_degree": this.bass_degree_value,
    }
    const response = await fetch("/utils/print_progression_chord?degree=" + data.degree + "&modifier=" + data.modifier + "&chord=" + data.chord_type + "&duration=" + data.duration + "&scale=" + data.scale + "&key=" + data.key, {
      method: "GET",
      mode: "cors",
      credentials: "same-origin",
      headers: { "Content-Type": "application/json" },
    });

    const chord = await response.text();
    this.display.innerText = chord;
  }

  async adjust_degree_labels() {
    const data = {
      "scale": this.scale.value,
      "key": this.key.value,
      "modifier": this.modifier.value
    }

    const response = await fetch("/utils/get_degrees?scale=" + data.scale + "&key=" + data.key + "&modifier=" + data.modifier, {
      method: "GET",
      mode: "cors",
      credentials: "same-origin",
      headers: { "Content-Type": "application/json" }
    })

    const chords = await response.json();
    
    console.log(chords);

    // Adjust degree picker labels
    for (let i = 0; i < 7; ++i) {
      //(!) doesn't adapt to scales with fewer or more than 7 notes
      this.degree.children[i].children[1].innerText = chords[i].print
    }
  }

  adjust_bassDegree_labels() {

  }


}
