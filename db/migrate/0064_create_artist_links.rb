class CreateArtistLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :artist_links do |t|
      t.references :artist, null: false, foreign_key: true, index: true
      t.references :song_link_type, null: false, foreign_key: true, index: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
