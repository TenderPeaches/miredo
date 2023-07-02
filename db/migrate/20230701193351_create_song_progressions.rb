class CreateSongProgressions < ActiveRecord::Migration[7.0]
  def change
    create_table :song_progressions do |t|
      t.references :song, null: false, foreign_key: true
      t.references :progression, null: false, foreign_key: true
      t.integer :sequence

      t.timestamps
    end
  end
end
