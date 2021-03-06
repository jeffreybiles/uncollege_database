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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120312213847) do

  create_table "activities", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at",      :null => false
    t.timestamp "updated_at",      :null => false
    t.integer   "interests_count"
  end

  create_table "authentications", :force => true do |t|
    t.integer   "user_id"
    t.string    "provider"
    t.string    "uid"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "interests", :force => true do |t|
    t.integer   "user_id"
    t.integer   "activity_id"
    t.boolean   "wants_to_mentor"
    t.boolean   "wants_to_be_mentored"
    t.timestamp "created_at",           :null => false
    t.timestamp "updated_at",           :null => false
    t.text      "notes"
  end

  create_table "sessions", :force => true do |t|
    t.string    "session_id", :null => false
    t.text      "data"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_sessions", :force => true do |t|
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.string    "city"
    t.string    "college"
    t.string    "job"
    t.timestamp "created_at",                            :null => false
    t.timestamp "updated_at",                            :null => false
    t.string    "encrypted_password"
    t.string    "password_salt"
    t.string    "reset_password_token"
    t.string    "remember_token"
    t.timestamp "remember_created_at"
    t.string    "authentication_token"
    t.timestamp "reset_password_sent_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.boolean   "admin"
    t.integer   "interests_count"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
