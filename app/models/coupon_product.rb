class CouponProduct < ApplicationRecord
  belongs_to :promo
  belongs_to :product
end