class RenameSoundcloudTrackIdToSourceId < ActiveRecord::Migration
  def change
    rename_column :tracks, :soundcloud_track_id, :source_id
    change_column :tracks, :source_id, :string
  end
end
