class AddSoundcloudIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sound_cloud_id, :string
  end
end
