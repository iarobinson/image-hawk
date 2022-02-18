class AddAmountToCharge < ActiveRecord::Migration[6.1]
  def change
    add_monetize :charges, amount: { null: true, default: 3000 }
  end
end
