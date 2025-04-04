class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :uid, :string
    add_column :users, :image_url, :string
    add_column :users, :provider, :string
  end
end
