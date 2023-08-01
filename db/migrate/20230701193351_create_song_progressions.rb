class CreateSongProgressions < ActiveRecord::Migration[7.0]
  def change
    create_table :song_progressions do |t|
      t.references :song, null: false, foreign_key: true  
      t.references :progression, null: false, foreign_key: true
      t.integer :sequence # sequence number of the progression within the song => sequence==1 is first progression, etc.
      t.integer :reps, default: 1    # number of repetitions - times the progression is repeated at that point in the song
      t.string :lyrics    # lyrics tied to the progression
      t.string :tag       # text label to refer to this part of the song - can be shared between song progressions

      t.timestamps
    end
  end
end
