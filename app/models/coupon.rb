class Coupon < ApplicationRecord
  belongs_to :product
  has_one_attached :qrcode, dependent: :destroy
end
