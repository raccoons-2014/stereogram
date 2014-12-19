class AddConstraintsToSnippets < ActiveRecord::Migration
  def change
    change_column_null :snippets, :user_id, false
  end
end
