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


ActiveRecord::Schema.define(version: 2018_05_03_155536) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "courses", force: :cascade do |t|
    t.string "kind"
    t.integer "code"
    t.string "name"
    t.string "turn"
    t.integer "classification", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_subjects", id: false, force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "course_id", null: false
    t.index ["subject_id", "course_id"], name: "index_courses_subjects_on_subject_id_and_course_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "time_8", default: [], array: true
    t.string "time_10", default: [], array: true
    t.string "time_12", default: [], array: true
    t.string "time_14", default: [], array: true
    t.string "time_16", default: [], array: true
    t.string "time_19", default: [], array: true
    t.string "time_21", default: [], array: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "schedules_subjects", id: false, force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "schedule_id", null: false
    t.index ["subject_id", "schedule_id"], name: "index_schedules_subjects_on_subject_id_and_schedule_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.string "credits"
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "matricula"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "schedules", "users"
  add_foreign_key "users", "courses"
end
