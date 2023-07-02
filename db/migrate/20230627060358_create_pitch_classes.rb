class CreatePitchClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :pitch_classes do |t|
      t.string :solfege
      t.string :letter
      t.integer :position

      t.timestamps
    end
  end
end
