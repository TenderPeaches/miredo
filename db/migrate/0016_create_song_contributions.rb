class CreateSongContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :song_contributions do |t|
      t.string :parts     # "vocals, guitar" etc

      t.references :song, null: false, index: true, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.references :artist, null: false, index: true, foreign_key: { on_update: :cascade, on_delete: :cascade }

      t.timestamps
    end
  end
end
