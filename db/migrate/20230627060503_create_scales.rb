class CreateScales < ActiveRecord::Migration[7.0]
  def change
    create_table :scales do |t|
      t.string :name
      t.string :intervals

      t.timestamps
    end
  end
end
