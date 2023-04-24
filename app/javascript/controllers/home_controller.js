import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        alert("jjj");
        console.log("home_controller")
        $('#preloader').fadeOut('1000', function () {
            $(this).remove();
        });
        console.log("home_controller")
    }
}
