class AddPurchaserAndSellerToCharge < ActiveRecord::Migration[6.1]
  def change
    add_reference :charges, :seller, foreign_key: { to_table: :users }
    add_reference :charges, :purchaser, foreign_key: { to_table: :users }
    add_reference :charges, :session
  end
end
