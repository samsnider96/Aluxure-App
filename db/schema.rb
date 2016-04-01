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

ActiveRecord::Schema.define(version: 20160331203938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "appointment_items", force: :cascade do |t|
    t.integer  "appointment_request_id"
    t.integer  "item_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "status",                 default: "Pending"
  end

  add_index "appointment_items", ["appointment_request_id"], name: "index_appointment_items_on_appointment_request_id", using: :btree
  add_index "appointment_items", ["item_id"], name: "index_appointment_items_on_item_id", using: :btree

  create_table "appointment_requests", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "approved",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "declined",   default: false
  end

  add_index "appointment_requests", ["company_id"], name: "index_appointment_requests_on_company_id", using: :btree
  add_index "appointment_requests", ["updated_at"], name: "index_appointment_requests_on_updated_at", using: :btree
  add_index "appointment_requests", ["user_id"], name: "index_appointment_requests_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "appointment_request_id"
    t.text     "text"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
  end

  add_index "comments", ["appointment_request_id"], name: "index_comments_on_appointment_request_id", using: :btree
  add_index "comments", ["updated_at"], name: "index_comments_on_updated_at", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

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
    t.string   "url"
    t.string   "number_of_locations"
    t.string   "annual_revenue"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "image_uploads", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "image_uploads", ["user_id"], name: "index_image_uploads_on_user_id", using: :btree

  create_table "item_attributes", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "category"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "brand"
    t.string   "category"
    t.string   "color"
    t.string   "size"
    t.string   "material"
    t.string   "condition"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "image_upload_id"
    t.text     "alterations"
    t.string   "gender"
    t.string   "sub_category"
    t.string   "sleeve_length"
    t.string   "inseam_length"
    t.string   "suit_length"
    t.string   "shoe_width"
  end

  add_index "items", ["image_upload_id"], name: "index_items_on_image_upload_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "image_upload_id"
  end

  add_index "product_images", ["image_upload_id"], name: "index_product_images_on_image_upload_id", using: :btree
  add_index "product_images", ["item_id"], name: "index_product_images_on_item_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "company_id"
    t.string   "photo"
    t.boolean  "paid",                   default: false
    t.string   "type"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["photo"], name: "index_users_on_photo", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
