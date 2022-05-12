class MonetizeCharge < ActiveRecord::Migration[7.0]
  def change
    add_monetize :charges, :price, amount: { null: true, default: 3000 }
  end
end