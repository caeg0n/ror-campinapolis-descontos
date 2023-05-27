class Promo < ApplicationRecord
  belongs_to :organization
  enum status: {"enabled":1,"test_mode":2,"disabled":3}
end
