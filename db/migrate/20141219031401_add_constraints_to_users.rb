class AddConstraintsToUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    change_column_null :users, :provider, false
    change_column_null :users, :uid, false
    change_column_null :users, :token, false
    change_column_null :users, :profile_img_url, false
  end
end
