class CreatePromos < ActiveRecord::Migration[7.0]
  def change
    create_table :promos do |t|
      t.references :organization, null: false, foreign_key: true
      t.decimal :coupon_price
      t.datetime :expiration
      t.integer :status

      t.timestamps
    end
  end
end
