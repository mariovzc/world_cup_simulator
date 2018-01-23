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

ActiveRecord::Schema.define(version: 20180123174359) do

  create_table "game_sub_types", force: :cascade do |t|
    t.string "name"
    t.integer "game_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_type_id"], name: "index_game_sub_types_on_game_type_id"
  end

  create_table "game_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "name"
    t.integer "match_type_id"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.datetime "date"
    t.integer "home_result"
    t.integer "away_result"
    t.integer "stadium_id"
    t.boolean "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_type_id"], name: "index_matches_on_match_type_id"
    t.index ["stadium_id"], name: "index_matches_on_stadium_id"
  end

  create_table "stadia", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "iso2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
