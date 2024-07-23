import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "filter", "flag" ]

    connect() {
        this.listen();
    }

    listen() {
        this.filterTarget.addEventListener('click', (e) => {
            
            // Locate the triggering filter field by bubbling up from the triggering element
            let target = e.target; // temporary target pointater

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
                    // Update the hidden form flag value to false: filter is not active
                    this.flagTarget.value = "false"
                } 
                // Else, the filter was not already active and is being activated
                else {
                    // Add the active flag to the filter element
                    target.classList.add("active");
                    // Update the hidden form flag value to true, so that the back-end correctly applies the filter
                    this.flagTarget.value = "false";
                }
            }
        })
    }
}

