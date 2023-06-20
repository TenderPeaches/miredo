class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :number
      t.integer :duration
      t.integer :nb_practices
      t.datetime :last_practiced
      t.integer :capo
      t.string :chords
      t.string :lyrics

      t.references :album, null: true, index: true

      t.timestamps
    end
  end
end
