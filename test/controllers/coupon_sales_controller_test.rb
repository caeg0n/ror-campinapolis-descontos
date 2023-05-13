require "test_helper"

class CouponSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_sale = coupon_sales(:one)
  end

  test "should get index" do
    get coupon_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_sale_url
    assert_response :success
  end

  test "should create coupon_sale" do
    assert_difference("CouponSale.count") do
      post coupon_sales_url, params: { coupon_sale: { coupon_type: @coupon_sale.coupon_type, promo_id: @coupon_sale.promo_id, status: @coupon_sale.status } }
    end

    assert_redirected_to coupon_sale_url(CouponSale.last)
  end

  test "should show coupon_sale" do
    get coupon_sale_url(@coupon_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_sale_url(@coupon_sale)
    assert_response :success
  end

  test "should update coupon_sale" do
    patch coupon_sale_url(@coupon_sale), params: { coupon_sale: { coupon_type: @coupon_sale.coupon_type, promo_id: @coupon_sale.promo_id, status: @coupon_sale.status } }
    assert_redirected_to coupon_sale_url(@coupon_sale)
  end

  test "should destroy coupon_sale" do
    assert_difference("CouponSale.count", -1) do
      delete coupon_sale_url(@coupon_sale)
    end

    assert_redirected_to coupon_sales_url
  end
end
