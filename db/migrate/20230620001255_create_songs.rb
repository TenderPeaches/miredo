class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name, comment: "Song name", default: ""
      t.integer :number, comment: "Position of the song in the album"
      t.integer :duration, comment: "Suggested approximate duration, given the default bpm"
      t.integer :nb_practices, comment: "Number of user-confirmed practices of this song", default: 0
      t.datetime :last_practiced, comment: "Datetime of the last user-confirmed practice of this song", null: true, default: nil
      t.integer :capo, comment: "Suggested capo, given the default key", default: 0
      t.string :chords, comment: "[being phased out] chord progression definitions as per lib.txt", default: ""
      t.string :lyrics, comment: "[being phased out] lyrics & chord progression implementations as per lib.txt", default: ""
      t.integer :bpm, comment: "Suggested beats-per-minutes the song should be played on", default: 120
      t.references :time_signature, comment: "Time signature for this song", null: true, index: true
      t.references :key, comment: "Default key the song is played it", null: true, index: true
      t.references :scale, comment: "Scale type used by this song", null: true, index: true
      t.references :album, comment: "Album this song appears on", null: true, index: true

      t.timestamps
    end
  end
end
