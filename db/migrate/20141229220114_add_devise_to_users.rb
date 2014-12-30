class AddDeviseToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
    end
  end
end
