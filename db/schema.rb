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

ActiveRecord::Schema.define(version: 20160314181508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_requests", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "photo"
    t.string   "name"
    t.text     "description"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "line_3"
    t.string   "city"
    t.string   "county_province"
    t.string   "zip_or_postcode"
    t.string   "country"
    t.string   "other_address_details"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "brand"
    t.string   "type"
    t.string   "color"
    t.string   "size"
    t.string   "material"
    t.string   "condition"
    t.string   "description"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "first_name"
    t.integer  "last_name"
    t.string   "phone"
    t.integer  "company_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
