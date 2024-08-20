class CreateInstrumentTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_templates do |t|
      t.string :name
      t.string :description
      t.string :filename

      t.timestamps
    end
  end
end
