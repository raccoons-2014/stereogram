class AddColumnsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :permalink_url, :string
    add_column :tracks, :artwork_url, :string
    add_column :tracks, :description, :text
    add_column :tracks, :duration, :string
    add_column :tracks, :waveform_url, :string
    add_column :tracks, :bpm, :string
  end
end
