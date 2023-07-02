class CreateIntervals < ActiveRecord::Migration[7.0]
  def change
    create_table :intervals do |t|
      t.integer :semitones
      t.string :name
      t.string :shorthand
      t.string :sonance
      t.string :comments

      t.timestamps
    end
  end
end
