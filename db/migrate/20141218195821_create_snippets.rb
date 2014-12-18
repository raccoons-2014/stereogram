class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.references :track
      t.references :user
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
