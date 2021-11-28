class CreateCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :charges do |t|
      t.string :success_url
      t.string :cancel_url
      t.string :asset_id

      t.timestamps
    end
  end
end
