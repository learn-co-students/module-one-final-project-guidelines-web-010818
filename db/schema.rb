# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180123213307) do

  create_table "clues", force: :cascade do |t|
    t.integer "neighborhood_id"
    t.string "text"
  end

  create_table "evidences", force: :cascade do |t|
    t.integer "game_id"
    t.string "suspect_name"
    t.string "gender"
    t.string "hair_color"
    t.string "eye_color"
    t.string "vehicle"
    t.string "favorite_food"
  end

  create_table "game_store_clues", force: :cascade do |t|
    t.integer "game_id"
    t.integer "store_id"
    t.integer "clue_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "player_id"
    t.integer "neighborhood_id"
    t.integer "suspect_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "rank"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "neighborhood_id"
    t.string "name"
    t.string "witness"
  end

  create_table "suspects", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "hair_color"
    t.string "eye_color"
    t.string "vehicle"
    t.string "favorite_food"
  end

end
