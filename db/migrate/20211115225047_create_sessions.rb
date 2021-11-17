class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
