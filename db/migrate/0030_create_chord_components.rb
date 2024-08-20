class CreateChordComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :chord_components do |t|
      t.references :chord, null: false, foreign_key: true
      t.references :interval, null: false, foreign_key: true
      t.references :interval_quality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
