class CreateCouponSales < ActiveRecord::Migration[7.0]
  def change
    create_table :coupon_sales do |t|
      t.integer :coupon_type
      t.decimal :value
      t.datetime :expiration
      t.integer :status

      t.timestamps
    end
  end
end
