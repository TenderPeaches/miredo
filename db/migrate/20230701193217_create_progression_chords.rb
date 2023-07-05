class CreateProgressionChords < ActiveRecord::Migration[7.0]
  def change
    create_table :progression_chords do |t|
      t.references :chord, null: false, foreign_key: true
      t.integer :degree
      t.integer :modifier         # semitones modifier, for when chords are off-key and therefore don't match an exact degree
      t.integer :bass_degree      # for chords like C/G, A/G#, etc
      t.integer :bass_modifier    # if G is off-key and C/G needs to be used
      t.string :duration
      t.string :sequence
      t.references :progression, null: false, foreign_key: true

      t.timestamps
    end
  end
end
