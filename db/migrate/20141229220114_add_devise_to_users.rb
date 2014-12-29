class AddDeviseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, null: false
  end
end
