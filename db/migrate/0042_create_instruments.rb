class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :name, null: false, comment: "Common name of the instrument"
      t.boolean :uses_capo, default: false, null: false, comment: "Whether or not the instrument can make use of a capo"
      t.references :instrument_template, null: false, foreign_key: true, comment: "Instrument views are meant to be similar to the instrument they portray, so some will look irreconcilably different while others might look similar with minor differences"

      t.timestamps
    end
  end
end
