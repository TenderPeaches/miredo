class CreateProgressionTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :progression_templates do |t|
      t.string :tag
      t.integer :reps, default: 1
      t.references :song, comment: "Song for which this progression is available", null: false, index: true
      t.references :key, comment: "If progression key doesn't match song's default key", null: true, index: true
      t.references :scale, comment: "If progression scale doesn't match song's default scale", null: true, index: true

      t.timestamps
    end
  end
end
