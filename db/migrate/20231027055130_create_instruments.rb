class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :name, null: false, comment: "Common name of the instrument"
      t.boolean :uses_capo, default: false, null: false, comment: "Whether or not the instrument can make use of a capo"
      t.references :default_tuning, null: true, foreign_key: { to_table: :tunings }, comment: "Default tuning for this instrument"

      t.timestamps
    end
  end
end
