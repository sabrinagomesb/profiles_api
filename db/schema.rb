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

ActiveRecord::Schema[7.0].define(version: 2023_09_15_044454) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "company_name", limit: 255, null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.text "function_performed", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_experiences_on_profile_id"
  end

  create_table "profile_abilities", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "ability_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_id"], name: "index_profile_abilities_on_ability_id"
    t.index ["profile_id"], name: "index_profile_abilities_on_profile_id"
  end

  create_table "profile_softskills", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "softskill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_softskills_on_profile_id"
    t.index ["softskill_id"], name: "index_profile_softskills_on_softskill_id"
  end

  create_table "profile_teches", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "tech_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_teches_on_profile_id"
    t.index ["tech_id"], name: "index_profile_teches_on_tech_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.date "birthdate", null: false
    t.string "phone", limit: 11, null: false
    t.string "links", default: [], array: true
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio", null: false
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_profiles_on_city_id"
  end

  create_table "softskills", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "acronym", limit: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.date "start_date"
    t.date "end_date"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link", limit: 255
    t.string "institution", null: false
    t.index ["profile_id"], name: "index_studies_on_profile_id"
  end

  create_table "teches", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teches_on_name", unique: true
  end

  add_foreign_key "cities", "states"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "profile_abilities", "abilities"
  add_foreign_key "profile_abilities", "profiles"
  add_foreign_key "profile_softskills", "profiles"
  add_foreign_key "profile_softskills", "softskills"
  add_foreign_key "profile_teches", "profiles"
  add_foreign_key "profile_teches", "teches"
  add_foreign_key "profiles", "cities"
  add_foreign_key "studies", "profiles"
end
