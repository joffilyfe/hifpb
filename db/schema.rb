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


ActiveRecord::Schema.define(version: 20170617210351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campus", force: :cascade do |t|
    t.string "description"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "semesters", force: :cascade do |t|
    t.string "year"
    t.string "semester"
    t.date "start_date"
    t.date "end_date"
  end

  create_table "teachers", primary_key: "registration", force: :cascade do |t|
    t.string "name"
    t.string "campus"
    t.string "department"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_subjects", "courses"
  add_foreign_key "courses", "campus"
end
