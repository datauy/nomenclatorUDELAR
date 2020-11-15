# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_13_175453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "building_id", null: false
    t.text "detail"
    t.string "noun"
    t.string "name"
    t.bigint "person_id", null: false
    t.text "observations"
    t.text "naming_details"
    t.date "naming_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_intangibles_on_building_id"
    t.index ["person_id"], name: "index_intangibles_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.integer "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "places", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.integer "type"
    t.string "detail"
    t.string "name"
    t.bigint "person_id", null: false
    t.text "observations"
    t.text "naming_details"
    t.date "naming_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ptype"
    t.index ["building_id"], name: "index_places_on_building_id"
    t.index ["person_id"], name: "index_places_on_person_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "import_logs", "import_versions"
  add_foreign_key "intangibles", "buildings"
  add_foreign_key "intangibles", "people"
  add_foreign_key "places", "buildings"
  add_foreign_key "places", "people"
end
