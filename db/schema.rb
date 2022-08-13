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

ActiveRecord::Schema[7.0].define(version: 2022_07_22_233021) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.decimal "years"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educationals", force: :cascade do |t|
    t.integer "degree_id"
    t.integer "university_id"
    t.date "start_at"
    t.date "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsords", force: :cascade do |t|
    t.string "name"
    t.date "start_from"
    t.date "end_to"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stipends", force: :cascade do |t|
    t.integer "student_id"
    t.integer "amount"
    t.date "stipend_in"
    t.date "recevied_at"
    t.string "recevied_by"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "father_name"
    t.string "mobile_number"
    t.string "jazzcash_number"
    t.string "cnic"
    t.string "address"
    t.string "father_occupation"
    t.string "emergency_number"
    t.date "registered_at"
    t.date "stipend_start_at"
    t.date "stipend_end_at"
    t.string "state"
    t.integer "category_id"
    t.integer "educational_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role", default: "admin", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
