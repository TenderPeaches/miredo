class CreateSetlists < ActiveRecord::Migration[7.1]
  def change
    create_table :setlists do |t|
      t.string :name, comment: "Setlist name", null: true
      t.references :user, null: false, foreign_key: true, comment: "User for whom the setlist appears"
      t.integer :play_count, comment: "How many times the setlist was played from beginning to end", null: false, default: 0

      t.timestamps
    end
  end
end
