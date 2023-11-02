class CreateTunings < ActiveRecord::Migration[7.0]
  def change
    create_table :tunings do |t|
      t.string :label, null: true

      t.timestamps
    end
  end
end
