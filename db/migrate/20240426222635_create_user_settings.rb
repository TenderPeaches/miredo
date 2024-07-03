class CreateUserSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_settings do |t|
      t.integer :color_scheme, comment: "TBD"
      t.integer :colorblind_mode, comment: "TBD"
      t.integer :font_size, comment: "Default font size"
      t.references :instrument, null: true, foreign_key: true, comment: "Default instrument"
      t.references :user, null: false, foreign_key: true, comment: "User to whom these settings apply"

      t.timestamps
    end
  end
end
