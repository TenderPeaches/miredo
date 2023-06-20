class CreateAlbumContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :album_contributions do |t|

      t.references :albums, null: false, index: true
      t.references :artists, null: false, index: true
      t.timestamps
    end
  end
end
