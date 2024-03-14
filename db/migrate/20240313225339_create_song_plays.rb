class CreateSongPlays < ActiveRecord::Migration[7.0]
  def change
    create_table :song_plays do |t|
      t.references :user, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
      t.datetime :played_at
      t.boolean :by_heart

      t.timestamps
    end
  end
end
