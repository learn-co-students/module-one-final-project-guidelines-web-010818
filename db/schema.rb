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

ActiveRecord::Schema.define(version: 20180124195935) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
    t.boolean "visited"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "name"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.float "yelp_rating"
    t.float "latitude"
    t.float "longitude"
    t.integer "yelp_review_count"
    t.string "yelp_id"
    t.string "category"
    t.float "mealpal_rating"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "meal_id"
    t.integer "rating"
    t.text "content"
    t.date "date"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

end
