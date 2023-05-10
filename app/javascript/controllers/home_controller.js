import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        $('#preloader').fadeOut('1000', function () {
            $(this).remove();
        });
    }
}
