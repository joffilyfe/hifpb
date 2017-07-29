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

ActiveRecord::Schema.define(version: 20170728190357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_authorizations_on_course_id"
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "campus", force: :cascade do |t|
    t.string "description"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campus_schedules", force: :cascade do |t|
    t.integer "shift"
    t.time "start"
    t.time "end"
    t.bigint "campus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campus_id", "start", "end"], name: "index_campus_schedules_on_campus_id_and_start_and_end", unique: true
    t.index ["campus_id"], name: "index_campus_schedules_on_campus_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "course_id"
    t.bigint "course_subject_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "semester_id"
    t.index ["course_id"], name: "index_classrooms_on_course_id"
    t.index ["course_subject_id"], name: "index_classrooms_on_course_subject_id"
    t.index ["semester_id"], name: "index_classrooms_on_semester_id"
    t.index ["teacher_id"], name: "index_classrooms_on_teacher_id"
  end

  create_table "course_subjects", force: :cascade do |t|
    t.string "initials"
    t.string "description"
    t.integer "kind"
    t.integer "count_rating"
    t.string "description_history"
    t.boolean "optinonal"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "semester"
    t.index ["course_id"], name: "index_course_subjects_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "code"
    t.bigint "campus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campus_id"], name: "index_courses_on_campus_id"
  end

  create_table "laboratories", force: :cascade do |t|
    t.integer "maximum_capacity"
    t.integer "amount_resources"
    t.boolean "status"
    t.string "name"
    t.string "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schoolrooms", force: :cascade do |t|
    t.integer "maximum_capacity"
    t.integer "amount_resources"
    t.boolean "status"
    t.string "name"
    t.string "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string "year"
    t.string "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
  end

  create_table "teachers", primary_key: "registration", force: :cascade do |t|
    t.string "name"
    t.string "campus"
    t.string "department"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "registration"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "authorizations", "courses"
  add_foreign_key "authorizations", "users"
  add_foreign_key "campus_schedules", "campus"
  add_foreign_key "classrooms", "course_subjects"
  add_foreign_key "classrooms", "courses"
  add_foreign_key "classrooms", "semesters"
  add_foreign_key "course_subjects", "courses"
  add_foreign_key "courses", "campus"
end
