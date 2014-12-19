class AddColumnSoundcloudTrackId < ActiveRecord::Migration
  def change
    add_column :tracks, :soundcloud_track_id, :integer
  end
end
