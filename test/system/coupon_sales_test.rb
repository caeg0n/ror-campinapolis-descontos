require "application_system_test_case"

class CouponSalesTest < ApplicationSystemTestCase
  setup do
    @coupon_sale = coupon_sales(:one)
  end

  test "visiting the index" do
    visit coupon_sales_url
    assert_selector "h1", text: "Coupon sales"
  end

  test "should create coupon sale" do
    visit coupon_sales_url
    click_on "New coupon sale"

    fill_in "Coupon type", with: @coupon_sale.coupon_type
    fill_in "Expiration", with: @coupon_sale.expiration
    fill_in "Status", with: @coupon_sale.status
    fill_in "Value", with: @coupon_sale.value
    click_on "Create Coupon sale"

    assert_text "Coupon sale was successfully created"
    click_on "Back"
  end

  test "should update Coupon sale" do
    visit coupon_sale_url(@coupon_sale)
    click_on "Edit this coupon sale", match: :first

    fill_in "Coupon type", with: @coupon_sale.coupon_type
    fill_in "Expiration", with: @coupon_sale.expiration
    fill_in "Status", with: @coupon_sale.status
    fill_in "Value", with: @coupon_sale.value
    click_on "Update Coupon sale"

    assert_text "Coupon sale was successfully updated"
    click_on "Back"
  end

  test "should destroy Coupon sale" do
    visit coupon_sale_url(@coupon_sale)
    click_on "Destroy this coupon sale", match: :first

    assert_text "Coupon sale was successfully destroyed"
  end
end
