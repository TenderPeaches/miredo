class CreateIntervalQualities < ActiveRecord::Migration[7.0]
  def change
    create_table :interval_qualities do |t|
      t.string :name
      t.string :shorthand
      t.integer :modifier

      t.timestamps
    end
  end
end
