class CreateSongPlays < ActiveRecord::Migration[7.0]
  def change
    create_table :song_plays do |t|
      t.references :user, null: false, foreign_key: true, comment: "User who played the song"
      t.references :song, null: false, foreign_key: true, comment: "Song that was played"
      t.datetime :played_at, null: true, comment: "Time and date when the song was played"
      t.boolean :by_heart, default: false, comment: "Whether the song was played without aids"

      t.timestamps
    end
  end
end
