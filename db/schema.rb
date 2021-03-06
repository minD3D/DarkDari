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

ActiveRecord::Schema.define(version: 20170811063116) do

  create_table "appointments", force: :cascade do |t|
    t.string   "title",                   null: false
    t.text     "content",                 null: false
    t.datetime "deadline",                null: false
    t.integer  "period",                  null: false
    t.string   "location",   default: "", null: false
    t.string   "app_type",                null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "infos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "appointment_id"
    t.integer  "money",          default: 0
    t.boolean  "done",           default: false
    t.boolean  "builder",        default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["appointment_id"], name: "index_infos_on_appointment_id"
    t.index ["user_id"], name: "index_infos_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "requester_id"
    t.integer  "appointment_id"
    t.string   "type"
    t.string   "message"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["appointment_id"], name: "index_notifications_on_appointment_id"
    t.index ["requester_id"], name: "index_notifications_on_requester_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "texts", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "nickname",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
