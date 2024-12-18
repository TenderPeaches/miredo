class CreateSetlistSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :setlist_songs do |t|
      t.references :setlist, null: false, foreign_key: true, index: true
      t.references :song, null: false, foreign_key: true, index: true
      t.integer :sequence, comment: "Position of the song within the setlist"

      t.timestamps
    end
  end
end
