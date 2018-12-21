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

ActiveRecord::Schema.define(version: 2018_10_28_153605) do

  create_table "activities", force: :cascade do |t|
    t.datetime "activity_datetime"
    t.string "recurrency"
    t.string "activity_name"
    t.string "description"
    t.json "details"
    t.integer "kid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_activities_on_kid_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.datetime "pickup_time"
    t.json "details"
    t.string "pick_up_address"
    t.string "destination_address"
    t.integer "activity_id"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_journeys_on_activity_id"
    t.index ["driver_id"], name: "index_journeys_on_driver_id"
  end

  create_table "kids", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_kids_on_parent_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.integer "parent_id"
    t.string "driving_licence"
    t.string "status"
    t.index ["parent_id"], name:"index_drivers_on_parent_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "status"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
