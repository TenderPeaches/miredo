class CreateKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :keys do |t|
      t.string :name
      t.string :shorthand
      t.integer :flats
      t.integer :sharps
      t.string :quality
      t.references :pitch_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
