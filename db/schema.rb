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

ActiveRecord::Schema.define(version: 20180314182157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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

  create_table "archaeological_sites", force: :cascade do |t|
    t.string   "site_number"
    t.string   "site_name"
    t.string   "parish"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "location_description"
    t.text     "recommendations"
    t.text     "summary"
    t.text     "notes"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "references"
    t.integer  "representative_image_id"
  end

  add_index "archaeological_sites", ["parish"], name: "index_archaeological_sites_on_parish", using: :btree
  add_index "archaeological_sites", ["site_name"], name: "index_archaeological_sites_on_site_name", using: :btree
  add_index "archaeological_sites", ["site_number"], name: "index_archaeological_sites_on_site_number", using: :btree

  create_table "archaeological_sites_ceramic_diagnostics", force: :cascade do |t|
    t.integer "archaeological_site_id"
    t.integer "ceramic_diagnostic_id"
  end

  create_table "archaeological_sites_ceramic_types", force: :cascade do |t|
    t.integer "archaeological_site_id"
    t.integer "ceramic_type_id"
  end

  create_table "archaeological_sites_previous_works", force: :cascade do |t|
    t.integer "archaeological_site_id"
    t.integer "previous_work_id"
  end

  create_table "archaeological_sites_threats", force: :cascade do |t|
    t.integer "archaeological_site_id"
    t.integer "threat_id"
  end

  create_table "ceramic_diagnostics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "ceramic_diagnostics", ["description"], name: "index_ceramic_diagnostics_on_description", using: :btree
  add_index "ceramic_diagnostics", ["name"], name: "index_ceramic_diagnostics_on_name", using: :btree

  create_table "ceramic_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "ceramic_types", ["description"], name: "index_ceramic_types_on_description", using: :btree
  add_index "ceramic_types", ["name"], name: "index_ceramic_types_on_name", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "generic_files", force: :cascade do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "archaeological_site_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "description"
  end

  add_index "generic_files", ["description"], name: "index_generic_files_on_description", using: :btree
  add_index "generic_files", ["name"], name: "index_generic_files_on_name", using: :btree

  create_table "maps", force: :cascade do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "archaeological_site_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "width"
    t.integer  "height"
    t.text     "description"
  end

  add_index "maps", ["description"], name: "index_maps_on_description", using: :btree
  add_index "maps", ["name"], name: "index_maps_on_name", using: :btree

  create_table "previous_works", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "previous_works", ["description"], name: "index_previous_works_on_description", using: :btree
  add_index "previous_works", ["name"], name: "index_previous_works_on_name", using: :btree

  create_table "site_files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "file"
  end

  create_table "threats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "threats", ["description"], name: "index_threats_on_description", using: :btree
  add_index "threats", ["name"], name: "index_threats_on_name", using: :btree

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
    t.integer  "role",                   default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
