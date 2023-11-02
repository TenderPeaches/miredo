import { Controller } from "@hotwired/stimulus"
import Api from "../core/api.js"

export default class extends Controller {
  static targets = [ 'generator', 'newProgsList', 'display', 'inputDegree', 'inputModifier', 'inputChordType', 'settingSetBass', 'inputDuration', 'scale', 'key', 'inputBassDegree', 'inputBassModifier', 'bassControls', 'selectedProgression', 'selectedProgressionChord', 'progressionChordSequence', 'progressionSequenceDisplay', 'progressionChordSequenceDisplay', 'progressionSequence'];

  get new_progressions_list() { return this.newProgsListTarget }
  
  get generator() { return this.generatorTarget }
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
  get scale() { return this.scaleTarget }
  get key() { return this.keyTarget }
  get bass_controls() { return this.bassControlsTarget }
  get progression() { return this.selectedProgressionTarget }
  get progressionSequence_display() { return this.progressionSequenceDisplayTarget }
  get progressionChordSequence_display() { return this.progressionChordSequenceDisplayTarget }
  get progressionChord() { return this.selectedProgressionChordTarget }
  get progressionChordSequence() { return this.progressionChordSequenceTarget }
  get progressionSequence() { return this.progressionSequenceTarget }

  // 
  async add_progression_form(e) {
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
  }

  // on page load
  connect() {
    //console.log(this.display, this.degree, this.degree_value, this.modifier, this.bass_degree, this.bass_degree_value, this.bass_modifier, this.chord_type, this.set_bass, this.duration, this.scale, this.key, this.bass_controls);
    this.adjust_all_displays();
  }

  async select_progression(event) {
    let target = event.target;

    //! watch out if the progression cards' class name changes
    // bubble up to find the progression card
    while (!target.classList.contains("card--progression") && target.tagName != "BODY") {
      target = target.parentElement;
    }  

    // should never happen
    if (target.tagName == "BODY") {
      console.error(target, 'can\'t find progression card');
      return false;
    }

    // If generator is hidden 
    if (this.generator.classList.contains('hidden')) {
      // Show generator
      this.generator.classList.remove('hidden');
    }
    
    // Update the "progression_id" input value, so the generator knows which progression is being updated
    this.progression.value = target.dataset['id'];
    // Update the generator's progression sequence display to give user feedback
    this.progressionSequence_display.innerText = target.dataset['sequence'];

    // By default, select first progression_chord 
    this.progressionChord.value = "1";
    // Update the generator's progression chord sequence display to give user feedback
    this.progressionChordSequence_display.innerText = "1";
    
   // this.update_generator_inputs(/* progression_chord_id from where? */);
  }

  select_progression_chord(event) {
    this.update_generator_inputs(event.target.dataset['progressionId'], event.target.dataset['progressionChordId'], event.target.dataset['sequence']);
  }

  next_progression() {

  }

  previous_progression() {

  }

  next_progression_chord() {

  }

  previous_progression_chord() {

  }

  async update_generator_inputs(progression_id = 0, progression_chord_id = 0, sequence = 0) {
    // if no progression chord selected
    if (progression_chord_id == 0) {
      // Hide generator
      this.generator.classList.add('hidden');
    }
    // Otherwise, a progression_chord is selected
    else {
      // make sure generator is shown
      this.generator.classList.remove('hidden');
      const selector = '.hidden-progression-form input[name="progressions[' + progression_id + '][chords][' + sequence + ']';

      debugger;
      // Load the hidden form data onto the generator's input fields

      // to change value of the "degree" radio button, need to set the appropriate button's checked attribute value to true
      this.degree.querySelector('.degree_' + document.querySelector(selector + '[degree]"]').value + ' input').checked = true;
      this.chord_type.value = document.querySelector(selector + '[chord_id]"]').value;
      this.duration.value = document.querySelector(selector + '[duration]"]').value;
      this.modifier.value = document.querySelector(selector + '[modifier]"]').value;
      this.bass_modifier.value = document.querySelector(selector + '[bass_modifier]"]').value;
      this.bass_degree.value = document.querySelector(selector + '[bass_degree]"]').value;

      // Update the generator's chord display
      const request = new FetchRequest('get', "/utils/print_progression_chord?degree=" + data.degree + "&modifier=" + data.modifier + "&chord=" + data.chord_type + "&duration=" + data.duration + "&scale=" + data.scale + "&key=" + data.key);
      const response = await request.perform();
      if (response.ok) {
        this.display.innerText = await response.text;
      } 

    }
  }

  on_degree_change(event) {
    console.log(event);
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

  async adjust_display() {

    const data = [];
    data["degree"] = document.querySelector('.generator__input--degree').querySelector('input:checked').value;
    data["modifier"] = this.modifier.value;
    data["bass_degree"] = document.querySelector('.generator__input--bass-degree').querySelector('input:checked')?.value || null;
    data["bass_modifier"] = this.bass_modifier.value;
    data["chord_type"] = this.chord_type.value;
    data["duration"] = this.duration.value;
    data["key"] = this.key.value;
    data["scale"] = this.scale.value;
    
    const response = await Api.get("/utils/print_progression_chord?degree=" + data.degree + "&modifier=" + data.modifier + "&chord=" + data.chord_type + "&duration=" + data.duration + "&bass_degree=" + data.bass_degree + "&bass_modifier=" + data.bass_modifier + "&scale=" + data.scale + "&key=" + data.key);

    const chord = await response.text();
      
    this.display.innerText = chord;               
    
    //generator.querySelector('.generator__display')?.innerText = chord;  
  }

  async adjust_degree_labels() {
    const data = {
      "scale": this.scale.value,
      "key": this.key.value,
      "modifier": this.modifier.value
    }

    const response = await fetch("/utils/get_degrees?scale=" + data.scale + "&key=" + data.key + "&modifier=" + data.modifier);

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
