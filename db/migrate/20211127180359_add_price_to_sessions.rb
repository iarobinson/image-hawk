class AddPriceToSessions < ActiveRecord::Migration[6.1]
  def change
    add_monetize :sessions, :default_price, currency: { present: false }, default: 3000
  end
end
