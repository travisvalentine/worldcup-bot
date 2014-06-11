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

ActiveRecord::Schema.define(version: 20140611005216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: true do |t|
    t.integer  "number"
    t.string   "round"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "played_at"
    t.string   "stadium"
    t.string   "group",              limit: 1
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.integer  "home_penalty_goals"
    t.integer  "away_penalty_goals"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["away_team_id"], name: "index_matches_on_away_team_id", using: :btree
  add_index "matches", ["group"], name: "index_matches_on_group", using: :btree
  add_index "matches", ["home_team_id"], name: "index_matches_on_home_team_id", using: :btree
  add_index "matches", ["number"], name: "index_matches_on_number", unique: true, using: :btree
  add_index "matches", ["round"], name: "index_matches_on_round", using: :btree

  create_table "teams", force: true do |t|
    t.string   "acronym",      limit: 3
    t.string   "name"
    t.string   "group"
    t.integer  "fifa_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["acronym"], name: "index_teams_on_acronym", unique: true, using: :btree
  add_index "teams", ["name"], name: "index_teams_on_name", unique: true, using: :btree

end
