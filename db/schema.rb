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

ActiveRecord::Schema.define(version: 2019_12_10_051601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "current_group_id"
    t.index ["current_group_id"], name: "index_accounts_on_current_group_id"
  end

  create_table "accounts_users", force: :cascade do |t|
    t.integer "account_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "user_id"], name: "index_accounts_users_on_account_id_and_user_id", unique: true
    t.index ["user_id"], name: "index_accounts_users_on_user_id"
  end

  create_table "ads", force: :cascade do |t|
    t.string "platform"
    t.integer "group_id"
    t.string "ad_type"
    t.text "description"
    t.string "media_1_url"
    t.string "media_1_subtitle"
    t.string "media_1_title"
    t.string "media_1_link"
    t.string "media_2_url"
    t.string "media_2_title"
    t.string "media_2_link"
    t.string "media_2_subtitle"
    t.string "media_3_url"
    t.string "media_3_title"
    t.string "media_3_link"
    t.string "media_3_subtitle"
    t.string "media_4_url"
    t.string "media_4_title"
    t.string "media_4_link"
    t.string "media_4_subtitle"
    t.string "media_5_url"
    t.string "media_5_title"
    t.string "media_5_link"
    t.string "media_5_subtitle"
    t.string "media_6_url"
    t.string "media_6_title"
    t.string "media_6_link"
    t.string "media_6_subtitle"
    t.string "media_7_url"
    t.string "media_7_title"
    t.string "media_7_link"
    t.string "media_7_subtitle"
    t.string "media_8_url"
    t.string "media_8_title"
    t.string "media_8_link"
    t.string "media_8_subtitle"
    t.string "media_9_url"
    t.string "media_9_title"
    t.string "media_9_link"
    t.string "media_9_subtitle"
    t.string "media_10_url"
    t.string "media_10_title"
    t.string "media_10_link"
    t.string "media_10_subtitle"
    t.datetime "scheduled_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ad_type"], name: "index_ads_on_ad_type"
    t.index ["group_id"], name: "index_ads_on_group_id"
    t.index ["platform"], name: "index_ads_on_platform"
    t.index ["scheduled_at"], name: "index_ads_on_scheduled_at"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_groups_on_account_id"
  end

  create_table "role_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.string "status", default: "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id", unique: true
    t.index ["status"], name: "index_roles_users_on_status"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "social_profiles", force: :cascade do |t|
    t.datetime "access_token_expires_at"
    t.string "avatar_url"
    t.string "consumer_key"
    t.string "consumer_secret"
    t.integer "follower_count"
    t.string "id_str"
    t.integer "group_id"
    t.string "oauth_token"
    t.string "oauth_token_secret"
    t.string "platform"
    t.string "screen_name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.boolean "admin"
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
