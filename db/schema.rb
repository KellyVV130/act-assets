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

ActiveRecord::Schema.define(version: 2022_02_28_081756) do

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "dn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "coords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.string "name"
    t.integer "top"
    t.integer "left"
    t.integer "right"
    t.integer "bottom"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_seats_on_room_id"
  end

  create_table "seats_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "seat_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "english_name"
    t.string "tel"
    t.string "email"
    t.string "account"
    t.string "grade"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.integer "supervisor_id"
    t.index ["group_id"], name: "index_users_on_group_id"
  end

end
