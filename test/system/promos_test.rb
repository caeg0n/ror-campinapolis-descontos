require "application_system_test_case"

class PromosTest < ApplicationSystemTestCase
  setup do
    @promo = promos(:one)
  end

  test "visiting the index" do
    visit promos_url
    assert_selector "h1", text: "Promos"
  end

  test "should create promo" do
    visit promos_url
    click_on "New promo"

    fill_in "Coupon price", with: @promo.coupon_price
    fill_in "Expiration", with: @promo.expiration
    fill_in "Organization", with: @promo.organization_id
    fill_in "Status", with: @promo.status
    click_on "Create Promo"

    assert_text "Promo was successfully created"
    click_on "Back"
  end

  test "should update Promo" do
    visit promo_url(@promo)
    click_on "Edit this promo", match: :first

    fill_in "Coupon price", with: @promo.coupon_price
    fill_in "Expiration", with: @promo.expiration
    fill_in "Organization", with: @promo.organization_id
    fill_in "Status", with: @promo.status
    click_on "Update Promo"

    assert_text "Promo was successfully updated"
    click_on "Back"
  end

  test "should destroy Promo" do
    visit promo_url(@promo)
    click_on "Destroy this promo", match: :first

    assert_text "Promo was successfully destroyed"
  end
end
