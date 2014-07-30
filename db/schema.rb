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

ActiveRecord::Schema.define(version: 20140721090330) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "delayed_jobs", force: true do |t|
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

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "documents", force: true do |t|
    t.integer  "docable_id"
    t.string   "docable_type"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homeworks", force: true do |t|
    t.integer  "student_id"
    t.integer  "lecture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  add_index "homeworks", ["lecture_id", "student_id"], name: "index_homeworks_on_lecture_id_and_student_id", unique: true

  create_table "lectures", force: true do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notices", force: true do |t|
    t.string   "text"
    t.integer  "noticable_id"
    t.string   "noticable_type"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name",                 default: "Ученик"
    t.string   "email"
    t.string   "password_digest"
    t.string   "confirmation_token"
    t.string   "state"
    t.integer  "grade",                default: 9
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.date     "birthday"
    t.string   "phone"
    t.string   "city"
    t.string   "surname"
    t.string   "middlename"
    t.string   "school"
    t.string   "reset_password_token"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true

  create_table "subject_students", force: true do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "average_score",   default: 0
    t.integer  "homeworks_count", default: 0
  end

  add_index "subject_students", ["subject_id", "student_id"], name: "index_subject_students_on_subject_id_and_student_id", unique: true

  create_table "subject_teachers", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_teachers", ["subject_id", "teacher_id"], name: "index_subject_teachers_on_subject_id_and_teacher_id", unique: true

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "average_score", default: 0
  end

  create_table "teachers", force: true do |t|
    t.string   "name",                 default: "Преподаватель"
    t.string   "email"
    t.string   "password_digest"
    t.string   "confirmation_token"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.date     "birthday"
    t.string   "phone"
    t.string   "city"
    t.string   "surname"
    t.string   "middlename"
    t.string   "reset_password_token"
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true

  create_table "videos", force: true do |t|
    t.integer  "lecture_id"
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
