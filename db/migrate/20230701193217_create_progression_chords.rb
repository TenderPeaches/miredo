class CreateProgressionChords < ActiveRecord::Migration[7.0]
  def change
    create_table :progression_chords do |t|
      t.references :chord, null: false, foreign_key: true
      t.integer :degree, default: 1                                           # degree given the progression's key
      t.integer :modifier, null: false, default: 0                            # semitones modifier, for when chords are off-key and therefore don't match an exact degree
      t.integer :bass_degree                                      # for chords like C/G, A/G#, etc
      t.integer :bass_modifier                                    # if G is off-key and C/G needs to be used
      t.integer :duration                                         # how many beats the chord is played for
      t.integer :sequence                                         # numerical sequence of the chord within the chord progression
      t.boolean :staccato                                         # if there is a pause between this chord and the next one
      t.boolean :muted                                            # if this chord is palm muted
      t.references :progression, null: false, foreign_key: true   

      t.timestamps
    end
  end
end
