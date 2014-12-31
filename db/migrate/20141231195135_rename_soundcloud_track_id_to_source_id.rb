class RenameSoundcloudTrackIdToSourceId < ActiveRecord::Migration
  def change
    rename_column :tracks, :soundcloud_track_id, :source_id
  end
end
