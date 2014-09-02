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

ActiveRecord::Schema.define(version: 20140827090621) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["invitation_token"], name: "index_admin_users_on_invitation_token", unique: true
  add_index "admin_users", ["invitations_count"], name: "index_admin_users_on_invitations_count"
  add_index "admin_users", ["invited_by_id"], name: "index_admin_users_on_invited_by_id"
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "admins", force: true do |t|
    t.string   "name",               default: "Админушка"
    t.string   "email"
    t.string   "password_digest"
    t.string   "confirmation_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
