json.extract! coupon_product, :id, :promo_id, :product_id, :coupon_type, :status, :created_at, :updated_at
json.url coupon_product_url(coupon_product, format: :json)
