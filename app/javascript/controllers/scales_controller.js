import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(e) {
    console.log("Hello", this.element);
  }
}
