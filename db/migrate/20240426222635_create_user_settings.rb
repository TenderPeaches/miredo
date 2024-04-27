class CreateUserSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_settings do |t|
      t.integer :color_scheme, comment: "TBD"
      t.integer :font_size
      t.integer :colorblind_mode

      t.timestamps
    end
  end
end
