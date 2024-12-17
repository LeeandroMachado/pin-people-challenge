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

ActiveRecord::Schema[7.2].define(version: 2024_12_17_043426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "coordinations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_coordinations_on_name", unique: true
  end

  create_table "directorates", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_directorates_on_name", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "corporate_email"
    t.bigint "positions_functions_area_id", null: false
    t.bigint "organization_structure_id", null: false
    t.integer "gender"
    t.integer "generation"
    t.bigint "city_id", null: false
    t.string "tenure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_employees_on_city_id"
    t.index ["corporate_email"], name: "index_employees_on_corporate_email", unique: true
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["organization_structure_id"], name: "index_employees_on_organization_structure_id"
    t.index ["positions_functions_area_id"], name: "index_employees_on_positions_functions_area_id"
  end

  create_table "functional_areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_functional_areas_on_name", unique: true
  end

  create_table "functions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_functions_on_name", unique: true
  end

  create_table "managements", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_managements_on_name", unique: true
  end

  create_table "org_areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_org_areas_on_name", unique: true
  end

  create_table "organization_structures", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "directorate_id", null: false
    t.bigint "management_id", null: false
    t.bigint "coordination_id", null: false
    t.bigint "org_area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "directorate_id", "management_id", "coordination_id", "org_area_id"], name: "idx_on_company_id_directorate_id_management_id_coor_303a14abc0", unique: true
    t.index ["company_id"], name: "index_organization_structures_on_company_id"
    t.index ["coordination_id"], name: "index_organization_structures_on_coordination_id"
    t.index ["directorate_id"], name: "index_organization_structures_on_directorate_id"
    t.index ["management_id"], name: "index_organization_structures_on_management_id"
    t.index ["org_area_id"], name: "index_organization_structures_on_org_area_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_positions_on_name", unique: true
  end

  create_table "positions_functions_areas", force: :cascade do |t|
    t.bigint "position_id", null: false
    t.bigint "function_id", null: false
    t.bigint "functional_area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["function_id"], name: "index_positions_functions_areas_on_function_id"
    t.index ["functional_area_id"], name: "index_positions_functions_areas_on_functional_area_id"
    t.index ["position_id", "function_id", "functional_area_id"], name: "idx_on_position_id_function_id_functional_area_id_2cb3a9cd3c", unique: true
    t.index ["position_id"], name: "index_positions_functions_areas_on_position_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "response_date"
    t.integer "interest_in_position"
    t.text "interest_in_position_comments"
    t.integer "contribution"
    t.text "contribution_comments"
    t.integer "learning_and_development"
    t.text "learning_and_development_comments"
    t.integer "feedback"
    t.text "feedback_comments"
    t.integer "manager_interaction"
    t.text "manager_interaction_comments"
    t.integer "career_clarity"
    t.text "career_clarity_comments"
    t.integer "permanence_expectation"
    t.text "permanence_expectation_comments"
    t.integer "enps"
    t.text "enps_comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id", "response_date"], name: "index_survey_responses_on_employee_id_and_response_date"
    t.index ["employee_id"], name: "index_survey_responses_on_employee_id"
  end

  add_foreign_key "employees", "cities"
  add_foreign_key "employees", "organization_structures"
  add_foreign_key "employees", "positions_functions_areas"
  add_foreign_key "organization_structures", "companies"
  add_foreign_key "organization_structures", "coordinations"
  add_foreign_key "organization_structures", "directorates"
  add_foreign_key "organization_structures", "managements"
  add_foreign_key "organization_structures", "org_areas"
  add_foreign_key "positions_functions_areas", "functional_areas"
  add_foreign_key "positions_functions_areas", "functions"
  add_foreign_key "positions_functions_areas", "positions"
  add_foreign_key "survey_responses", "employees"
end
