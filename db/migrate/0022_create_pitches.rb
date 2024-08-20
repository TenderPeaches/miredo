class CreatePitches < ActiveRecord::Migration[7.0]
  def change
    create_table :pitches do |t|
      t.integer :octave
      t.references :pitch_class, null: false, foreign_key: true
      t.float :frequency
      t.references :pitch_standard, null: false, foreign_key: true
      t.integer :midi

      t.timestamps
    end
  end
end
