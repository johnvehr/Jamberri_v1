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

ActiveRecord::Schema.define(version: 20150908174825) do

  create_table "events", force: :cascade do |t|
    t.string   "event_title"
    t.datetime "starts_at"
    t.string   "time_zone"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "host_id"
    t.string   "event_avatar_file_name"
    t.string   "event_avatar_content_type"
    t.integer  "event_avatar_file_size"
    t.datetime "event_avatar_updated_at"
  end

  add_index "events", ["host_id"], name: "index_events_on_host_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "hosts", force: :cascade do |t|
    t.string   "host_title"
    t.text     "host_bio"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.string   "host_avatar_file_name"
    t.string   "host_avatar_content_type"
    t.integer  "host_avatar_file_size"
    t.datetime "host_avatar_updated_at"
  end

  add_index "hosts", ["user_id"], name: "index_hosts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
