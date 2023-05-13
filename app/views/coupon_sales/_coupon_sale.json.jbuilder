json.extract! coupon_sale, :id, :promo_id, :coupon_type, :status, :created_at, :updated_at
json.url coupon_sale_url(coupon_sale, format: :json)
