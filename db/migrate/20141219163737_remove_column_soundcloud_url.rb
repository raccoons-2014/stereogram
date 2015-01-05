class RemoveColumnSoundcloudUrl < ActiveRecord::Migration
  def change
    remove_column :tracks, :soundcloud_url
  end
end
