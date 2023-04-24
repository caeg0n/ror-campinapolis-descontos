class Product < ApplicationRecord
  belongs_to :organization
  belongs_to :product_category
end
