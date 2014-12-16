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

ActiveRecord::Schema.define(version: 20141216154650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bar_gig_memberships", force: true do |t|
    t.integer  "bar_id",     null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bar_gig_memberships", ["bar_id"], name: "index_bar_gig_memberships_on_bar_id", using: :btree
  add_index "bar_gig_memberships", ["user_id"], name: "index_bar_gig_memberships_on_user_id", using: :btree

  create_table "bars", force: true do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "zip"
    t.string   "phone",      null: false
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "bars", ["name", "address", "city", "state"], name: "index_bars_on_name_and_address_and_city_and_state", using: :btree
  add_index "bars", ["user_id"], name: "index_bars_on_user_id", using: :btree

  create_table "bartender_profiles", force: true do |t|
    t.string   "name",       null: false
    t.string   "phone",      null: false
    t.string   "email"
    t.string   "twitter"
    t.string   "facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manager_profiles", force: true do |t|
    t.string   "name",       null: false
    t.string   "phone",      null: false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shift_memberships", force: true do |t|
    t.integer  "shift_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shift_memberships", ["shift_id"], name: "index_shift_memberships_on_shift_id", using: :btree
  add_index "shift_memberships", ["user_id"], name: "index_shift_memberships_on_user_id", using: :btree

  create_table "shifts", force: true do |t|
    t.integer  "bar_id",                      null: false
    t.date     "shift_date",                  null: false
    t.time     "shift_start",                 null: false
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bartender_count", default: 1
  end

  add_index "shifts", ["bar_id"], name: "index_shifts_on_bar_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "manager",         null: false
    t.string   "profile_type"
    t.integer  "profile_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
