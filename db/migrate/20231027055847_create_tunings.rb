class CreateTunings < ActiveRecord::Migration[7.0]
  def change
    create_table :tunings do |t|
      t.string :label, null: true, comment: "Conventional label for this tuning"
      t.references :instrument, null: false, foreign_key: true, comment: "Instrument for which this tuning is intended"

      t.timestamps
    end
  end
end
