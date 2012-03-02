class AddAuthlogicStuffToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password

    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
    add_column :users, :single_access_token, :string
    add_column :users, :perishable_token, :string

  end
end
