class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :coupon_type
      t.decimal :value
      t.datetime :expiration
      t.integer :status

      t.timestamps
    end
  end
end