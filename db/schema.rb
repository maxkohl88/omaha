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

ActiveRecord::Schema.define(version: 20140909201719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offensive_plays", force: true do |t|
    t.string   "play_name",            null: false
    t.string   "play_type",            null: false
    t.text     "player1_coordinates",  null: false, array: true
    t.text     "player2_coordinates",  null: false, array: true
    t.text     "player3_coordinates",  null: false, array: true
    t.text     "player4_coordinates",  null: false, array: true
    t.text     "player5_coordinates",  null: false, array: true
    t.text     "player6_coordinates",  null: false, array: true
    t.text     "player7_coordinates",  null: false, array: true
    t.text     "player8_coordinates",  null: false, array: true
    t.text     "player9_coordinates",  null: false, array: true
    t.text     "player10_coordinates", null: false, array: true
    t.text     "player11_coordinates", null: false, array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
