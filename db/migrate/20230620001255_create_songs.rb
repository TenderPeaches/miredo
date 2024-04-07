class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name, comment: "Song name", default: ""
      t.integer :number, comment: "Position of the song in the album"
      t.integer :duration, comment: "Suggested approximate duration, given the default bpm"
      t.integer :capo, comment: "Suggested capo, given the default key", null: true, default: 0
      t.datetime :last_practiced
      t.integer :nb_practices
      t.string :chords, comment: "[being phased out] chord progression definitions as per lib.txt", default: ""
      t.string :lyrics, comment: "[being phased out] lyrics & chord progression implementations as per lib.txt", default: ""
      t.integer :bpm, comment: "Suggested beats-per-minutes the song should be played on", default: 120
      t.boolean :is_public, default: true, comment: "Whether this song can be viewed by anyone other than the user who submitted it"
      t.references :time_signature, comment: "Time signature for this song", null: true, index: true
      t.references :key, comment: "Default key the song is played it", null: true, index: true
      t.references :scale, comment: "Scale type used by this song", null: true, index: true
      t.references :album, comment: "Album this song appears on", index: true
      t.references :submitter, null: true, index: true, foreign_key: { to_table: :users }, comment: "User who submitted the song"

      t.timestamps
    end
  end
end
