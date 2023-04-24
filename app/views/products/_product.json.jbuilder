json.extract! product, :id, :organization_id, :product_category_id, :price, :name, :created_at, :updated_at
json.url product_url(product, format: :json)
