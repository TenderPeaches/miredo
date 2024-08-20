class CreateChords < ActiveRecord::Migration[7.0]
  def change
    create_table :chords do |t|
      t.string :name
      t.string :notation

      t.timestamps
    end
  end
end
