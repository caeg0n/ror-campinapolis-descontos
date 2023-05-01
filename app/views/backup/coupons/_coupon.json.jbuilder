json.extract! coupon, :id, :product_id, :coupon_type, :value, :expiration, :status, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
