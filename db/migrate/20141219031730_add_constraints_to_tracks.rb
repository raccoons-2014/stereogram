class AddConstraintsToTracks < ActiveRecord::Migration
  def change
    change_column_null :tracks, :user_id, false
  end
end
