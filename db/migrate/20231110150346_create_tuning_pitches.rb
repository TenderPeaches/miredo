class CreateTuningPitches < ActiveRecord::Migration[7.0]
  def change
    create_table :tuning_pitches do |t|
      t.references :pitch, null: false, foreign_key: true
      t.references :tuning, null: false, foreign_key: true

      t.timestamps
    end
  end
end
