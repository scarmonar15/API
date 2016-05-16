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

ActiveRecord::Schema.define(version: 20160516222934) do

  create_table "assignments", force: true do |t|
    t.date     "limit_date"
    t.string   "description"
    t.float    "grade"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["project_id"], name: "index_assignments_on_project_id"

  create_table "learnings", force: true do |t|
    t.string   "name"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "learnings", ["student_id"], name: "index_learnings_on_student_id"

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "student_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["student_id"], name: "index_reports_on_student_id"

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["team_id"], name: "index_students_on_team_id"

  create_table "students_tasks", force: true do |t|
    t.integer  "student_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students_tasks", ["student_id"], name: "index_students_tasks_on_student_id"
  add_index "students_tasks", ["task_id"], name: "index_students_tasks_on_task_id"

  create_table "tasks", force: true do |t|
    t.string   "description"
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["assignment_id"], name: "index_tasks_on_assignment_id"

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_assignments", force: true do |t|
    t.integer  "team_id"
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams_assignments", ["assignment_id"], name: "index_teams_assignments_on_assignment_id"
  add_index "teams_assignments", ["team_id"], name: "index_teams_assignments_on_team_id"

  create_table "teams_projects", force: true do |t|
    t.integer  "team_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams_projects", ["project_id"], name: "index_teams_projects_on_project_id"
  add_index "teams_projects", ["team_id"], name: "index_teams_projects_on_team_id"

end
