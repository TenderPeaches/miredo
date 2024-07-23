import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "filter", "flag", "controls" ]

    connect() {
        this.listen();
    }

    listen() {
        this.filterTarget.addEventListener('click', (e) => {
            
            // Locate the triggering filter field by bubbling up from the triggering element
            let target = e.target; // temporary target pointater

            // If target is within the filter controls, either because:
            if (
                // the click was in the filter-controls element
                target.classList.contains("filter-controls") || 
                // the click was on a child of filter-controls element 
                //! if there are elements nested at least two levels deep, this will need to be adjusted
                target.parentElement.classList.contains("filter-controls") || 
                // the click was on an option (otherwise, the select inputs trigger a click when a value is clicked and the event triggers the filter to deactivate, which is not the intended behavior of selecting a filtered value from a select input)
                e.originalTarget.nodeName == "OPTION") {
                return      // don't toggle, the click was meant to interact with the control
            }

            // If the target's class contains either "filter-field" (what we're looking for) or "filters" (to let us know we've gone too far and somehow the triggering field hasn't been found, which implies a bug)
            while (!target.classList.contains("filter-field") && !target.classList.contains("filters")) {
                // Evaluate the target's parent element
                target = target.parentElement;
            }

            // If a valid filter field target has been assessed
            if (target.classList.contains("filter-field")) {
                // If the filter is already active
                if (target.classList.contains("active")) {
                    // Remove the active flag
                    target.classList.remove("active");

                    try {
                        // Update the hidden form flag value to false: filter is not active
                        this.flagTarget.value = "false"
                    } catch (error) {
                        // no flag control, expected of non-boolean filter fields
                    }
                    // Hide the controls, if applicable
                    try {
                        this.controlsTarget.classList.add("hidden");
                        // Go through all the controls' inputs and disable them, so their value doesn't get sent to the filter form
                        const controls = [...this.controlsTarget.children];
                        controls.forEach((control) => {
                            control.disabled = true;
                        })
                    } catch (error) {
                        // no filter controls, expected of boolean-like filter fields
                    }
                } 
                // Else, the filter was not already active and is being activated
                else {
                    // Add the active flag to the filter element
                    target.classList.add("active");

                    try {
                        // Update the hidden form flag value to true, so it acts like a checkbox
                        this.flagTarget.value = "true";
                    } catch (error) {
                        // expected of non-boolean filter fields
                    }

                    try {
                        // show filter controls
                        this.controlsTarget.classList.remove("hidden");
                        // Go through all the controls' inputs and enable them, so their value if passed along as a filter
                        const controls = [...this.controlsTarget.children];
                        controls.forEach((control) => {
                            control.disabled = false;
                        })
                    } catch (error) {
                        // expected of boolean-like filter fields
                    }
                }
            }
        })
    }
}

