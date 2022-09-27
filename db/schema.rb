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

ActiveRecord::Schema.define(version: 2022_09_27_065158) do

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "post_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "email", limit: 100, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", limit: 25
    t.string "password_digest"
    t.string "uid"
    t.index ["username"], name: "index_admin_users_on_username"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trainer_id", null: false
    t.integer "client_id", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "rating"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
