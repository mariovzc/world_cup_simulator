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

ActiveRecord::Schema.define(version: 20180123151425) do

  create_table "group_teams", force: :cascade do |t|
    t.integer "group_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_teams_on_group_id"
    t.index ["team_id"], name: "index_group_teams_on_team_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "team_local_id"
    t.integer "team_visitor_id"
    t.integer "team_local_score"
    t.integer "team_visitor_score"
    t.integer "phase_id"
    t.date "game_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_id"], name: "index_matches_on_phase_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
