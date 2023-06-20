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

ActiveRecord::Schema[7.0].define(version: 2023_06_20_144909) do
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

  create_table "song_contributions", force: :cascade do |t|
    t.string "parts"
    t.integer "song_id", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_song_contributions_on_artist_id"
    t.index ["song_id"], name: "index_song_contributions_on_song_id"
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
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

end
