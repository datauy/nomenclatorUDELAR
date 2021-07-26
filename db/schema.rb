# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_21_112811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buildings_services", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "building_id", null: false
    t.index ["service_id", "building_id"], name: "index_buildings_services_on_service_id_and_building_id"
  end

  create_table "import_logs", force: :cascade do |t|
    t.bigint "import_version_id", null: false
    t.string "object_type"
    t.integer "object_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["import_version_id"], name: "index_import_logs_on_import_version_id"
  end

  create_table "import_versions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intangibles", force: :cascade do |t|
    t.text "detail"
    t.string "noun"
    t.string "name"
    t.text "observations"
    t.text "naming_details"
    t.date "naming_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "thing_id"
    t.index ["thing_id"], name: "index_intangibles_on_thing_id"
  end

  create_table "intangibles_people", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "intangible_id", null: false
    t.index ["intangible_id", "person_id"], name: "index_intangibles_people_on_intangible_id_and_person_id"
  end

  create_table "intangibles_services", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "intangible_id", null: false
    t.index ["service_id", "intangible_id"], name: "index_intangibles_services_on_service_id_and_intangible_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.integer "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people_places", id: false, force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "person_id", null: false
    t.index ["place_id", "person_id"], name: "index_people_places_on_place_id_and_person_id"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.integer "type"
    t.string "detail"
    t.string "name"
    t.text "observations"
    t.text "naming_details"
    t.date "naming_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ptype"
    t.bigint "thing_id"
    t.index ["building_id"], name: "index_places_on_building_id"
    t.index ["thing_id"], name: "index_places_on_thing_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "things", force: :cascade do |t|
    t.string "name"
    t.integer "ttype"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "import_logs", "import_versions"
  add_foreign_key "intangibles", "things"
  add_foreign_key "places", "buildings"
  add_foreign_key "places", "things"
end
