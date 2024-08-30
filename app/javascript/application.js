// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./core/api.js"

// Update an input's value
Turbo.StreamActions.update_input = function() {
    
    const value = this.getAttribute("text");

    this.targetElements.forEach((target) => {
        target.value = value
    });

};

// Show and activate an input, which both presents the user with the opportunity to change the input's value and sends the value along with the form when it is submitted
Turbo.StreamActions.activate_inputs = function() {
    this.targetElements.forEach((target) => {
        target.disabled = false;            // enable the target
        target.classList.remove("hidden");  // show the target
    
    })
}

// Hide and deactivate an input, so that it is not shown to the user and its value is not submitted along with the form
Turbo.StreamActions.deactivate_inputs = function() {
    this.targetElements.forEach((target) => {
        target.disabled = true;            // enable the target
        target.classList.add("hidden");  // show the target
    })
}


// Hide a particular element
Turbo.StreamActions.hide = function() {
    const targets = this.targetElements.length > 0 ? this.targetElements : document.querySelector(this.target);

    if (targets != null) {
        targets.forEach((target) => {
            target.classList.add("hidden");
        })
    }
}

// Show a particular element
Turbo.StreamActions.show = function() {
    const targets = this.targetElements.length > 0 ? this.targetElements : document.querySelector(this.target);

    if (targets != null) {
        targets.forEach((target) => {
            target.classList.remove("hidden");
        })
    }
}



Turbo.StreamActions.add_class = function() {
    const added_class = this.getAttribute("value");

    this.targetElements.forEach((target) => {
        // Unless the target already has the target class
        if (!target.classList.contains(added_class)) {
            target.classList.add(added_class);
        }
    })
}

Turbo.StreamActions.remove_class = function() {
    const removed_class = this.getAttribute("value");

    this.targetElements.forEach((target) => {
        // Unless the target already has the target class
        if (target.classList.contains(removed_class)) {
            target.classList.remove(removed_class);
        }
    })
}

// field errors can be applied on more than just the input itself, so wrap them around their own turbo function
Turbo.StreamActions.add_field_error = function() {
    
    // The target is the input field with an ID, which is meant to be targetted by a turbo_stream response that triggers the errors on each invalid attribute's fields 
    const targetElement = document.querySelector(`#${this.target}`);

    // Target not found, see on triggering turbo_script response if the target ID is correct
    if (targetElement) {

        // The <div class="field"> wrapped around the invalid input
        const field = targetElement.parentElement;
    
        // The error message to be displayed, should already be a tag.div or something otherwise will be displayed as raw string
        const message = this.getAttribute("value");
    
        // Add the error class to the field itself, the input's class doesn't need to change as the CSS can target it as a children of .field.error
        field.classList.add("error");
    
        // Insert the error message below/after the field, if there's any message to display
        if (message && message.length > 0) {
            this.target.after(message);
        }
    }
}
