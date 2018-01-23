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

ActiveRecord::Schema.define(version: 20180123165147) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stretch_id"
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
  end

  create_table "stretch_muscle_groups", force: :cascade do |t|
    t.integer "stretch_id"
    t.integer "muscle_group_id"
  end

  create_table "stretches", force: :cascade do |t|
    t.string  "name"
    t.integer "time_in_sec"
    t.integer "stars_count"
    t.text    "instructions"
  end

  create_table "user_muscle_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "muscle_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
