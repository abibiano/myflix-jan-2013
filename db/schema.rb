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

ActiveRecord::Schema.define(:version => 20130424101616) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.string   "friend_full_name"
    t.string   "friend_email"
    t.text     "message"
    t.string   "token"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "payments", :force => true do |t|
    t.text     "transaction_id"
    t.integer  "user_id"
    t.decimal  "amount"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "queue_items", :force => true do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "reviews", :force => true do |t|
    t.text     "content"
    t.integer  "rating"
    t.integer  "video_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "full_name"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin",                  :default => false
    t.string   "stripe_id"
    t.boolean  "active"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "small_cover_url"
    t.string   "large_cover_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "category_id"
    t.string   "video_url"
  end

end
