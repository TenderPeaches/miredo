class CreateProgressions < ActiveRecord::Migration[7.0]
  def change
    create_table :progressions do |t|
      t.references :song, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.references :progression_template, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.integer :sequence, null: false # sequence number of the progression within the song => sequence==1 is first progression, etc.
      t.integer :reps, default: 1    # number of repetitions - times the progression is repeated at that point in the song
      t.references :key, comment: "If this particlar progression key doesn't match song's default key or progression's key", null: true, index: true, foreign_key: { on_update: :cascade, on_delete: :nullify }
      t.references :scale, comment: "If this particular progression scale doesn't match song's default scale or progression scale", null: true, index: true, foreign_key: { on_update: :cascade, on_delete: :nullify }
      t.string :lyrics    # lyrics tied to the progression
      t.string :tag       # text label to refer to this part of the song - can be shared between song progressions

      t.timestamps
    end
  end
end
