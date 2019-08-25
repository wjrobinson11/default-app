# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_25_230130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contests", force: :cascade do |t|
    t.decimal "calculated_prize_pool", precision: 8, scale: 2
    t.datetime "entry_deadline"
    t.decimal "vegas_bucks", precision: 8, scale: 2
    t.decimal "entry_fee", precision: 8, scale: 2
    t.decimal "rake", precision: 8, scale: 2
    t.integer "start_week"
    t.integer "end_week"
    t.integer "duration_in_weeks"
    t.integer "max_entrants"
    t.integer "current_entrants"
    t.decimal "guaranteed_prize_pool", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["current_entrants"], name: "index_contests_on_current_entrants"
    t.index ["duration_in_weeks"], name: "index_contests_on_duration_in_weeks"
    t.index ["guaranteed_prize_pool"], name: "index_contests_on_guaranteed_prize_pool"
    t.index ["max_entrants"], name: "index_contests_on_max_entrants"
    t.index ["start_week"], name: "index_contests_on_start_week"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "timezone"
    t.string "phone"
    t.string "state"
    t.string "country"
    t.date "dob"
    t.boolean "agreed_tas"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
