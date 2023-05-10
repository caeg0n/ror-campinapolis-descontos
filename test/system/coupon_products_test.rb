require "application_system_test_case"

class CouponProductsTest < ApplicationSystemTestCase
  setup do
    @coupon_product = coupon_products(:one)
  end

  test "visiting the index" do
    visit coupon_products_url
    assert_selector "h1", text: "Coupon products"
  end

  test "should create coupon product" do
    visit coupon_products_url
    click_on "New coupon product"

    fill_in "Coupon type", with: @coupon_product.coupon_type
    fill_in "Expiration", with: @coupon_product.expiration
    fill_in "Product", with: @coupon_product.product_id
    fill_in "Status", with: @coupon_product.status
    fill_in "Value", with: @coupon_product.value
    click_on "Create Coupon product"

    assert_text "Coupon product was successfully created"
    click_on "Back"
  end

  test "should update Coupon product" do
    visit coupon_product_url(@coupon_product)
    click_on "Edit this coupon product", match: :first

    fill_in "Coupon type", with: @coupon_product.coupon_type
    fill_in "Expiration", with: @coupon_product.expiration
    fill_in "Product", with: @coupon_product.product_id
    fill_in "Status", with: @coupon_product.status
    fill_in "Value", with: @coupon_product.value
    click_on "Update Coupon product"

    assert_text "Coupon product was successfully updated"
    click_on "Back"
  end

  test "should destroy Coupon product" do
    visit coupon_product_url(@coupon_product)
    click_on "Destroy this coupon product", match: :first

    assert_text "Coupon product was successfully destroyed"
  end
end
