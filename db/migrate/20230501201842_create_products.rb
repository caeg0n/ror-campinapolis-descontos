class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true
      t.decimal :price
      t.string :name

      t.timestamps
    end
  end
end
