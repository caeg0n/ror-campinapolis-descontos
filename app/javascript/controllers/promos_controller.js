import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        const productRadio = document.getElementById('coupon_type_product');
        const saleRadio = document.getElementById('coupon_type_sale');
        const div = document.getElementById('product_select');
        // const html = '';


        saleRadio.addEventListener('change', function () {
            if (saleRadio.checked) {
                div.hidden = true;
                // div.innerHTML = '';
            }
        });

        productRadio.addEventListener('change', function () {
            if (productRadio.checked) {
                div.hidden = false;
                // div.innerHTML = html;
            }
        });

    }
}
