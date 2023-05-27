class CouponSale < ApplicationRecord
  belongs_to :promo

  enum coupon_type: {"default":1}
  enum status: {"enabled":1,"disabled":2}
end
