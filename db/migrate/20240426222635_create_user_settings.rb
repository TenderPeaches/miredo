class CreateUserSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_settings do |t|
      t.integer :color_scheme, comment: "TBD"
      t.integer :colorblind_mode, comment: "TBD"
      t.integer :font_size, comment: "Default font size"
      t.integer :hot_plays_threshold, comment: "How many times a song needs to be played in the given timelapse for it to be considered \"hot\" for a given user"
      t.integer :hot_timelapse, comment: "How many days ago is considered \"recently\" for the sake of considering whether or not a song is \"hot\" for a given user"
      t.integer :old_heart_threshold, comment: "How long ago a song last played by heart needs to have been played last for it to be considered in need of making sure it's memorized"
      t.references :instrument, null: true, foreign_key: true, comment: "Default instrument"
      t.references :user, null: false, foreign_key: true, comment: "User to whom these settings apply"

      t.timestamps
    end
  end
end
