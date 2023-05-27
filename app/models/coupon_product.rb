class CouponProduct < ApplicationRecord
  belongs_to :promo
  belongs_to :product

  enum coupon_type: {"default":1}
  enum status: {"enabled":1,"disabled":2}
end
