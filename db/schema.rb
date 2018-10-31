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

ActiveRecord::Schema.define(version: 2018_07_02_121248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "professor_subject_id"
    t.bigint "subject_id"
    t.index ["professor_subject_id"], name: "index_comments_on_professor_subject_id"
    t.index ["subject_id"], name: "index_comments_on_subject_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "course_subjects", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "course_id"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_subjects_on_course_id"
    t.index ["subject_id"], name: "index_course_subjects_on_subject_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "kind"
    t.integer "code"
    t.string "name"
    t.string "turn"
    t.integer "classification", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "opcode"
    t.bigint "professors_id"
    t.bigint "departments_id"
    t.index ["departments_id"], name: "index_courses_on_departments_id"
    t.index ["professors_id"], name: "index_courses_on_professors_id"
  end

  create_table "courses_subjects", id: false, force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "course_id", null: false
    t.index ["subject_id", "course_id"], name: "index_courses_subjects_on_subject_id_and_course_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "initial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_forums_on_course_id"
  end

  create_table "professor_subject_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "professor_subject_id"
    t.integer "trabalhos"
    t.integer "provas"
    t.integer "tarefas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_subject_id"], name: "index_professor_subject_users_on_professor_subject_id"
    t.index ["user_id"], name: "index_professor_subject_users_on_user_id"
  end

  create_table "professor_subjects", force: :cascade do |t|
    t.bigint "professor_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_professor_subjects_on_professor_id"
    t.index ["subject_id"], name: "index_professor_subjects_on_subject_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "courses_id"
    t.bigint "departments_id"
    t.index ["courses_id"], name: "index_professors_on_courses_id"
    t.index ["departments_id"], name: "index_professors_on_departments_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "subject_id"
    t.integer "trabalhos"
    t.integer "provas"
    t.integer "tarefas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_ratings_on_subject_id"
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

  create_table "study_materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.string "description"
    t.bigint "user_id"
    t.index ["subject_id"], name: "index_study_materials_on_subject_id"
    t.index ["user_id"], name: "index_study_materials_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.string "credits"
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "forum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_topics_on_forum_id"
  end

  create_table "user_like_comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.boolean "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_user_like_comments_on_comment_id"
    t.index ["user_id"], name: "index_user_like_comments_on_user_id"
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

  add_foreign_key "comments", "professor_subjects"
  add_foreign_key "comments", "subjects"
  add_foreign_key "comments", "users"
  add_foreign_key "course_subjects", "courses"
  add_foreign_key "course_subjects", "subjects"
  add_foreign_key "courses", "departments", column: "departments_id"
  add_foreign_key "courses", "professors", column: "professors_id"
  add_foreign_key "forums", "courses"
  add_foreign_key "professor_subject_users", "professor_subjects"
  add_foreign_key "professor_subject_users", "users"
  add_foreign_key "professor_subjects", "professors"
  add_foreign_key "professor_subjects", "subjects"
  add_foreign_key "professors", "courses", column: "courses_id"
  add_foreign_key "professors", "departments", column: "departments_id"
  add_foreign_key "ratings", "subjects"
  add_foreign_key "schedules", "users"
  add_foreign_key "study_materials", "subjects"
  add_foreign_key "study_materials", "users"
  add_foreign_key "topics", "forums"
  add_foreign_key "user_like_comments", "comments"
  add_foreign_key "user_like_comments", "users"
  add_foreign_key "users", "courses"
end
