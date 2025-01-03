class CreateSongLinkTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :song_link_types do |t|
      t.string :label, null: false
      t.string :description, null: true
      t.string :icon, null: true

      t.timestamps
    end
  end
end
