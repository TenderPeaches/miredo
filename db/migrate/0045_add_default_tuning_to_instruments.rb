class AddDefaultTuningToInstruments < ActiveRecord::Migration[7.0]
  def change
    add_reference :instruments, :default_tuning, null: false, foreign_key: { to_table: :tunings }, comment: "Default tuning for this instrument"
  end
end
