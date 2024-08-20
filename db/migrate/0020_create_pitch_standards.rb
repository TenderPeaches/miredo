class CreatePitchStandards < ActiveRecord::Migration[7.0]
  def change
    create_table :pitch_standards do |t|
      t.string :name
      t.float :semitone
      t.float :base_frequency

      t.timestamps
    end
  end
end
