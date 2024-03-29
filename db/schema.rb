# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_25_170436) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "album_contributions", force: :cascade do |t|
    t.integer "albums_id", null: false
    t.integer "artists_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["albums_id"], name: "index_album_contributions_on_albums_id"
    t.index ["artists_id"], name: "index_album_contributions_on_artists_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chord_components", force: :cascade do |t|
    t.integer "chord_id", null: false
    t.integer "interval_id", null: false
    t.integer "interval_quality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chord_id"], name: "index_chord_components_on_chord_id"
    t.index ["interval_id"], name: "index_chord_components_on_interval_id"
    t.index ["interval_quality_id"], name: "index_chord_components_on_interval_quality_id"
  end

  create_table "chords", force: :cascade do |t|
    t.string "name"
    t.string "notation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interval_qualities", force: :cascade do |t|
    t.string "name"
    t.string "shorthand"
    t.integer "modifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intervals", force: :cascade do |t|
    t.integer "semitones"
    t.string "name"
    t.string "shorthand"
    t.string "sonance"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keys", force: :cascade do |t|
    t.string "name"
    t.string "shorthand"
    t.integer "flats"
    t.integer "sharps"
    t.string "quality"
    t.integer "pitch_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_class_id"], name: "index_keys_on_pitch_class_id"
  end

  create_table "pitch_classes", force: :cascade do |t|
    t.string "solfege"
    t.string "letter"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitch_standards", force: :cascade do |t|
    t.string "name"
    t.float "semitone"
    t.float "base_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.integer "octave"
    t.integer "pitch_class_id", null: false
    t.float "frequency"
    t.integer "pitch_standard_id", null: false
    t.integer "midi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_class_id"], name: "index_pitches_on_pitch_class_id"
    t.index ["pitch_standard_id"], name: "index_pitches_on_pitch_standard_id"
  end

  create_table "progression_chords", force: :cascade do |t|
    t.integer "chord_id", null: false
    t.integer "degree", default: 1
    t.integer "modifier", default: 0, null: false
    t.integer "bass_degree"
    t.integer "bass_modifier", default: 0, null: false
    t.integer "duration", default: 1
    t.integer "sequence"
    t.boolean "staccato"
    t.boolean "muted"
    t.integer "progression_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chord_id"], name: "index_progression_chords_on_chord_id"
    t.index ["progression_id"], name: "index_progression_chords_on_progression_id"
  end

  create_table "progressions", force: :cascade do |t|
    t.string "tag"
    t.integer "reps", default: 1
    t.integer "song_id", null: false
    t.integer "key_id"
    t.integer "scale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key_id"], name: "index_progressions_on_key_id"
    t.index ["scale_id"], name: "index_progressions_on_scale_id"
    t.index ["song_id"], name: "index_progressions_on_song_id"
  end

  create_table "scale_intervals", force: :cascade do |t|
    t.integer "scale_id", null: false
    t.integer "interval_id", null: false
    t.integer "interval_quality_id", null: false
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interval_id"], name: "index_scale_intervals_on_interval_id"
    t.index ["interval_quality_id"], name: "index_scale_intervals_on_interval_quality_id"
    t.index ["scale_id"], name: "index_scale_intervals_on_scale_id"
  end

  create_table "scales", force: :cascade do |t|
    t.string "name"
    t.string "intervals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "song_contributions", force: :cascade do |t|
    t.string "parts"
    t.integer "song_id", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_song_contributions_on_artist_id"
    t.index ["song_id"], name: "index_song_contributions_on_song_id"
  end

  create_table "song_progressions", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "progression_id", null: false
    t.integer "sequence"
    t.integer "reps", default: 1
    t.integer "key_id"
    t.integer "scale_id"
    t.string "lyrics"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key_id"], name: "index_song_progressions_on_key_id"
    t.index ["progression_id"], name: "index_song_progressions_on_progression_id"
    t.index ["scale_id"], name: "index_song_progressions_on_scale_id"
    t.index ["song_id"], name: "index_song_progressions_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", default: ""
    t.integer "number"
    t.integer "duration"
    t.integer "nb_practices", default: 0
    t.datetime "last_practiced"
    t.integer "capo", default: 0
    t.string "chords", default: ""
    t.string "lyrics", default: ""
    t.integer "bpm", default: 120
    t.integer "time_signature_id"
    t.integer "key_id"
    t.integer "scale_id"
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["key_id"], name: "index_songs_on_key_id"
    t.index ["scale_id"], name: "index_songs_on_scale_id"
    t.index ["time_signature_id"], name: "index_songs_on_time_signature_id"
  end

  create_table "time_signatures", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tuning_pitches", force: :cascade do |t|
    t.integer "pitch_id", null: false
    t.integer "tuning_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_tuning_pitches_on_pitch_id"
    t.index ["tuning_id"], name: "index_tuning_pitches_on_tuning_id"
  end

  create_table "tunings", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chord_components", "chords"
  add_foreign_key "chord_components", "interval_qualities"
  add_foreign_key "chord_components", "intervals"
  add_foreign_key "keys", "pitch_classes"
  add_foreign_key "pitches", "pitch_classes"
  add_foreign_key "pitches", "pitch_standards"
  add_foreign_key "progression_chords", "chords"
  add_foreign_key "progression_chords", "progressions"
  add_foreign_key "scale_intervals", "interval_qualities"
  add_foreign_key "scale_intervals", "intervals"
  add_foreign_key "scale_intervals", "scales"
  add_foreign_key "song_progressions", "progressions"
  add_foreign_key "song_progressions", "songs"
  add_foreign_key "tuning_pitches", "pitches"
  add_foreign_key "tuning_pitches", "tunings"
end
