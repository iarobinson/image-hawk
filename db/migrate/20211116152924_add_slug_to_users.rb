class AddSlugToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
    add_column :users, :name, :string
    add_column :users, :biography, :text
  end
end
