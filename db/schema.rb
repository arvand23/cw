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

ActiveRecord::Schema.define(version: 20150330044644) do

  create_table "bookings", force: true do |t|
    t.string   "skill"
    t.integer  "user_id"
    t.boolean  "pending_expert",             default: false
    t.datetime "time_request1"
    t.datetime "time_request2"
    t.datetime "time_request3"
    t.datetime "time_accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "complete_code"
    t.string   "permalink"
    t.text     "session",        limit: 255
    t.text     "session_token",  limit: 255
  end

  create_table "declines", force: true do |t|
    t.integer  "user_id"
    t.integer  "booking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "email"
    t.boolean  "expert",           default: false
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "booking_id"
    t.boolean  "pending_expert",   default: false
    t.string   "card_id"
  end

end
