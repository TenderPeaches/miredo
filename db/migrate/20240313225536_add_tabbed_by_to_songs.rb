class AddTabbedByToSongs < ActiveRecord::Migration[7.0]
  def change
      add_reference :songs, :tabber, foreign_key: { to_table: :users }
  end
end
