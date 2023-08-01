class CreateTimeSignatures < ActiveRecord::Migration[7.0]
  def change
    create_table :time_signatures do |t|
      t.string :label

      t.timestamps
    end
  end
end
