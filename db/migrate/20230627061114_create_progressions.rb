class CreateProgressions < ActiveRecord::Migration[7.0]
  def change
    create_table :progressions do |t|
      t.string :tag
      t.integer :reps, default: 1

      t.timestamps
    end
  end
end
