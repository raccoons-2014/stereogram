class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name # probably want some constraints here.
      t.string :last_name
      t.string :provider
      t.string :uid
      t.string :token
      t.string :profile_img_url

      t.timestamps
    end
  end
end
