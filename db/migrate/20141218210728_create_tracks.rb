class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :soundcloud_url
      t.references :user

      t.timestamps
    end
  end
end
