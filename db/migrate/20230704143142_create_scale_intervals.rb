class CreateScaleIntervals < ActiveRecord::Migration[7.0]
  def change
    create_table :scale_intervals do |t|
      t.references :scale, null: false, foreign_key: true
      t.references :interval, null: false, foreign_key: true
      t.references :interval_quality, null: false, foreign_key: true
      t.integer :sequence

      t.timestamps
    end
  end
end
