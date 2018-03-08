# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180308155849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_teams", force: true do |t|
    t.integer  "score"
    t.integer  "game_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_teams", ["game_id"], name: "index_game_teams_on_game_id", using: :btree
  add_index "game_teams", ["team_id"], name: "index_game_teams_on_team_id", using: :btree

  create_table "games", force: true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "match_teams", force: true do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "match_teams", ["match_id"], name: "index_match_teams_on_match_id", using: :btree
  add_index "match_teams", ["team_id"], name: "index_match_teams_on_team_id", using: :btree

  create_table "matches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

end
