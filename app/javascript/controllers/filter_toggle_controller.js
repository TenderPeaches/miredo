import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "toggle", "filter", "flag" ]

    connect() {
        this.listen();
    }

    listen() {
        this.toggleTarget.addEventListener('click', (e) => {
            debugger;
            //if /* filter is active */
                /* remove 'active' class from filter */

                /* change hidden input value */
            
            // when clicking on a filter toggle:
                // if it's already active
                    // deactivate:
                    // remove class
                    // change hidden input value
                // if it's not already active
                    // activate:
                    // add "active" class to filter
                    // change hidden input value
        })
    }
}

