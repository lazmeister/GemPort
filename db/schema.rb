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

ActiveRecord::Schema.define(:version => 20130522193411) do

  create_table "referrals", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
    t.string   "location"
    t.string   "referraltype"
    t.date     "eventdate"
    t.string   "coverage"
    t.integer  "budget"
    t.integer  "expirereplies"
    t.integer  "expiredays"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.string   "country"
  end

  add_index "referrals", ["user_id"], :name => "index_referrals_on_user_id"

  create_table "replies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "referral_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "replies", ["referral_id"], :name => "index_replies_on_referral_id"
  add_index "replies", ["user_id"], :name => "index_replies_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.binary   "image",                  :limit => 1048576
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "website"
    t.string   "location"
    t.integer  "phone"
    t.boolean  "notif_referrals"
    t.boolean  "notif_assistant"
  end

end
