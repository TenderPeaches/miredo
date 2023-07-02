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

ActiveRecord::Schema[7.0].define(version: 2023_07_01_193351) do
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
    t.integer "degree"
    t.string "duration"
    t.string "sequence"
    t.integer "progression_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chord_id"], name: "index_progression_chords_on_chord_id"
    t.index ["progression_id"], name: "index_progression_chords_on_progression_id"
  end

  create_table "progressions", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scale_types", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progression_id"], name: "index_song_progressions_on_progression_id"
    t.index ["song_id"], name: "index_song_progressions_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "duration"
    t.integer "nb_practices"
    t.datetime "last_practiced"
    t.integer "capo"
    t.string "chords"
    t.string "lyrics"
    t.float "bpm"
    t.integer "key_id"
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["key_id"], name: "index_songs_on_key_id"
  end

  add_foreign_key "chord_components", "chords"
  add_foreign_key "chord_components", "interval_qualities"
  add_foreign_key "chord_components", "intervals"
  add_foreign_key "keys", "pitch_classes"
  add_foreign_key "pitches", "pitch_classes"
  add_foreign_key "pitches", "pitch_standards"
  add_foreign_key "progression_chords", "chords"
  add_foreign_key "progression_chords", "progressions"
  add_foreign_key "song_progressions", "progressions"
  add_foreign_key "song_progressions", "songs"
end
