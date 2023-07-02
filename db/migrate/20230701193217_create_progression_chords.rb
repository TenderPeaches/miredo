class CreateProgressionChords < ActiveRecord::Migration[7.0]
  def change
    create_table :progression_chords do |t|
      t.references :chord, null: false, foreign_key: true
      t.integer :degree
      t.string :duration
      t.string :sequence
      t.references :progression, null: false, foreign_key: true

      t.timestamps
    end
  end
end
