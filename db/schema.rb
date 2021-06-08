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

ActiveRecord::Schema.define(version: 2021_06_08_222213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "linkedin"
    t.datetime "creation_date", default: -> { "now()" }
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_title"
    t.string "job_industry"
    t.string "company_name"
    t.text "job_description"
    t.string "resume"
    t.string "coverletter"
    t.string "location_city"
    t.string "location_state"
    t.datetime "creation_date", default: -> { "now()" }
    t.bigint "user_id", null: false
    t.integer "excitement", default: 0, null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "timeline_times", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.bigint "job_id", null: false
    t.index ["job_id"], name: "index_timeline_times_on_job_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "creation_date", default: -> { "now()" }
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "jobs", "users"
  add_foreign_key "timeline_times", "jobs"
end
