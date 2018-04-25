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
    t.index ["parish"], name: "index_archaeological_sites_on_parish", using: :btree
    t.index ["site_name"], name: "index_archaeological_sites_on_site_name", using: :btree
    t.index ["site_number"], name: "index_archaeological_sites_on_site_number", using: :btree
  end

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
    t.index ["description"], name: "index_ceramic_diagnostics_on_description", using: :btree
    t.index ["name"], name: "index_ceramic_diagnostics_on_name", using: :btree
  end

  create_table "ceramic_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.index ["description"], name: "index_ceramic_types_on_description", using: :btree
    t.index ["name"], name: "index_ceramic_types_on_name", using: :btree
  end

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
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "generic_files", force: :cascade do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "archaeological_site_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "description"
    t.index ["description"], name: "index_generic_files_on_description", using: :btree
    t.index ["name"], name: "index_generic_files_on_name", using: :btree
  end

  create_table "maps", force: :cascade do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "archaeological_site_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "width"
    t.integer  "height"
    t.text     "description"
    t.index ["description"], name: "index_maps_on_description", using: :btree
    t.index ["name"], name: "index_maps_on_name", using: :btree
  end

  create_table "previous_works", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.index ["description"], name: "index_previous_works_on_description", using: :btree
    t.index ["name"], name: "index_previous_works_on_name", using: :btree
  end

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
    t.index ["description"], name: "index_threats_on_description", using: :btree
    t.index ["name"], name: "index_threats_on_name", using: :btree
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
    t.integer  "role",                   default: 1
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role"], name: "index_users_on_role", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

end
