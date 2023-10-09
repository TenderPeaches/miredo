import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'newProgsList', 'display', 'inputDegree', 'inputModifier', 'inputChordType', 'settingSetBass', 'inputDuration', 'inputScale', 'inputKey', 'inputBassDegree', 'inputBassModifier', 'bassControls' ];

  get new_progressions_list() { return this.newProgsListTarget }
  /*
  get display() { return this.displayTarget }
  get degree() { return this.inputDegreeTarget }
  // shortcut for radio button group inputs value
  get degree_value() { return document.querySelector('input[name="progression[degree]"]:checked')?.value }
  get modifier() { return this.inputModifierTarget }
  get bass_degree() { return this.inputBassDegreeTarget }
  get bass_degree_value() { return document.querySelector('input[name="progression[bass_degree]"]:checked')?.value }
  get bass_modifier() { return this.inputBassModifierTarget }
  get chord_type() { return this.inputChordTypeTarget }
  get set_bass() { return this.settingSetBassTarget }
  get duration() { return this.inputDurationTarget }
  get scale() { return this.inputScaleTarget }
  get key() { return this.inputKeyTarget }
  get bass_controls() { return this.bassControlsTarget }*/

  add_progression_form(e) {
    // this.new_progressions_list.append()
  }

  // on page load
  connect() {
    console.log(this.display, this.degree, this.degree_value, this.modifier, this.bass_degree, this.bass_degree_value, this.bass_modifier, this.chord_type, this.set_bass, this.duration, this.scale, this.key, this.bass_controls);
    this.adjust_all_displays();
  }

  on_degree_change(event) {
    console.log(event);
    //this.adjust_display();
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
    console.log(event);
    this.adjust_display(event.target);
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

  get_generator_from_target(target) {
    // bubble up the DOM until we find generator__inputs
    while (target.className != "generator progression-chord-generator") {
      target = target.parentElement;

      // if bubbled up to body, error
      if (target.tagName == "BODY") {
        throw new Error("did not find .generator__inputs while bubbling up in get_formIdentifyingData");
      }
    }

    return target;
  }

  // to get the data that allows for an event to be traced back to its proper form 
  get_formIdentifyingData(target) {

    // get the data from the hidden input fields; these particular fields are the ones that can uniquely identify the form from which an event was fired: progression_chord_id if the progression_chord was already created, progression+sequence otherwise
    const progression_id = target.querySelector('input[data-field="progression_id"]').value;
    const progression_chord_id = target.querySelector('input[data-field="progression_chord_id"]').value;
    const progression_chord_sequence = target.querySelector('input[data-field="progression_chord_sequence"]').value;

    return {
      "progression_id" : progression_id,
      "progression_chord_id" : progression_chord_id,
      "progression_chord_sequence" : progression_chord_sequence
    }
  }

  get_generatorData(generator) {
    const data = this.get_formIdentifyingData(generator);

    data["degree"] = generator.querySelector('.generator__input--degree').querySelector('input:checked').value;
    data["modifier"] = generator.querySelector('.generator__input--degree-modifier input').value;
    data["bass_degree"] = generator.querySelector('.generator__input--bass-degree').querySelector('input:checked')?.value || null;
    data["bass_modifier"] = generator.querySelector('.generator__input--bass-degree-modifier input').value;
    data["chord_type"] = generator.querySelector('.generator__input--chord-type select').value;
    data["duration"] = generator.querySelector('.generator__input--duration input').value;
    data["key"] = generator.querySelector('input[data-field=progression_key]').value;
    data["scale"] = generator.querySelector('input[data-field=progression_scale]').value;
    
    return data;
  }

  async adjust_all_displays() {

  }

  async adjust_display(target) {
    debugger;
    // generator is the root element, from which children elements can be inferred
    const generator = this.get_generator_from_target(target);
    const formData = this.get_generatorData(generator);

    console.log(formData);
    debugger;

    const data = {
      /*
      // the selected radio button's value holds the degree
      // (!) all this is wrong, need to select the specific input 
      "degree": this.degree_value, 
      "modifier": this.modifier.value,
      "chord_type": this.chord_type.value,
      "duration": this.duration.value,
      "scale": this.scale.value,
      "key": this.key.value,
      "bass_degree": this.bass_degree_value,
      */
    }
    const response = await fetch("/utils/print_progression_chord?degree=" + data.degree + "&modifier=" + data.modifier + "&chord=" + data.chord_type + "&duration=" + data.duration + "&scale=" + data.scale + "&key=" + data.key, {
      method: "GET",
      mode: "cors",
      credentials: "same-origin",
      headers: { "Content-Type": "application/json" },
    });

    const chord = await response.text();
    //this.display.innerText = chord;               //(!) can't use target
    
    //generator.querySelector('.generator__display')?.innerText = chord;  
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

    // Adjust degree picker labels
    for (let i = 0; i < 7; ++i) {
      //(!) doesn't adapt to scales with fewer or more than 7 notes
      this.degree.children[i].children[1].innerText = chords[i].print
    }
  }

  async adjust_bassDegree_labels() {
    const data = {
      "scale": this.scale.value,
      "key": this.key.value,
      "modifier": this.bass_modifier.value
    }

    const response = await fetch("/utils/get_degrees?scale=" + data.scale + "&key=" + data.key + "&modifier=" + data.modifier, {
      method: "GET",
      mode: "cors",
      credentials: "same-origin",
      headers: { "Content-Type": "application/json" }
    })

    const chords = await response.json();

    // Adjust degree picker labels
    for (let i = 0; i < 7; ++i) {
      //(!) doesn't adapt to scales with fewer or more than 7 notes
      this.bass_degree.children[i].children[1].innerText = chords[i].print
    }
  }


}
