class CreateCouponSales < ActiveRecord::Migration[7.0]
  def change
    create_table :coupon_sales do |t|
      t.references :promo, null: false, foreign_key: true
      t.integer :coupon_type
      t.integer :status

      t.timestamps
    end
  end
end
