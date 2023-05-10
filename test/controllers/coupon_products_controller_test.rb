require "test_helper"

class CouponProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_product = coupon_products(:one)
  end

  test "should get index" do
    get coupon_products_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_product_url
    assert_response :success
  end

  test "should create coupon_product" do
    assert_difference("CouponProduct.count") do
      post coupon_products_url, params: { coupon_product: { coupon_type: @coupon_product.coupon_type, expiration: @coupon_product.expiration, product_id: @coupon_product.product_id, status: @coupon_product.status, value: @coupon_product.value } }
    end

    assert_redirected_to coupon_product_url(CouponProduct.last)
  end

  test "should show coupon_product" do
    get coupon_product_url(@coupon_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_product_url(@coupon_product)
    assert_response :success
  end

  test "should update coupon_product" do
    patch coupon_product_url(@coupon_product), params: { coupon_product: { coupon_type: @coupon_product.coupon_type, expiration: @coupon_product.expiration, product_id: @coupon_product.product_id, status: @coupon_product.status, value: @coupon_product.value } }
    assert_redirected_to coupon_product_url(@coupon_product)
  end

  test "should destroy coupon_product" do
    assert_difference("CouponProduct.count", -1) do
      delete coupon_product_url(@coupon_product)
    end

    assert_redirected_to coupon_products_url
  end
end
