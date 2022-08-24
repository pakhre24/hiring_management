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

ActiveRecord::Schema.define(version: 2022_08_20_132306) do

  create_table "core_skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interview_skill_ratings", force: :cascade do |t|
    t.integer "interview_id", null: false
    t.integer "core_skill_id", null: false
    t.decimal "score", precision: 2, scale: 1, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["core_skill_id"], name: "index_interview_skill_ratings_on_core_skill_id"
    t.index ["interview_id"], name: "index_interview_skill_ratings_on_interview_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "candidate_id", null: false
    t.integer "employee_id", null: false
    t.text "remarks"
    t.decimal "average_rating", precision: 2, scale: 1, default: "0.0"
    t.integer "round"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_interviews_on_candidate_id"
    t.index ["employee_id"], name: "index_interviews_on_employee_id"
  end

  create_table "user_core_skills", force: :cascade do |t|
    t.string "skillable_type"
    t.integer "skillable_id"
    t.integer "core_skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["core_skill_id"], name: "index_user_core_skills_on_core_skill_id"
    t.index ["skillable_type", "skillable_id"], name: "index_user_core_skills_on_skillable"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.date "dob"
    t.string "email"
    t.decimal "experience", precision: 4, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "interview_skill_ratings", "core_skills"
  add_foreign_key "interview_skill_ratings", "interviews"
  add_foreign_key "user_core_skills", "core_skills"
end
