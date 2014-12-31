class AddColumnsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :permalink_url, :string
    add_column :tracks, :artwork_url, :string
    add_column :tracks, :description, :string
    add_column :tracks, :duration, :integer
    add_column :tracks, :waveform_url, :string
    add_column :tracks, :bpm, :integer
  end
end
