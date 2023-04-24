import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("sessions_controller")
        // this.element.textContent = "Hello World!"
    }
}
