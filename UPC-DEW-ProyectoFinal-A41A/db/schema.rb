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

ActiveRecord::Schema.define(:version => 20130615001430) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.string   "ordinal"
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "concert_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["concert_id"], :name => "index_comments_on_concert_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "concert_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "concert_id"
    t.string   "estate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "concerts", :force => true do |t|
    t.string   "headline"
    t.text     "description"
    t.datetime "datestart"
    t.datetime "dateend"
    t.integer  "totalscore"
    t.integer  "local_id"
    t.integer  "group_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "estate",      :default => "INA"
  end

  add_index "concerts", ["group_id"], :name => "index_concerts_on_group_id"
  add_index "concerts", ["local_id"], :name => "index_concerts_on_local_id"

  create_table "group_users", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "genre"
    t.text     "biography"
    t.string   "pictureref"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "district"
    t.string   "address"
    t.string   "geolocation"
    t.string   "phone"
    t.string   "pictureref"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "estate",      :default => "INA"
  end

  create_table "picture_files", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.boolean  "isadmin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "givenname"
    t.string   "lastname1"
    t.string   "lastname2"
    t.string   "documentnumber"
    t.string   "documenttype"
    t.string   "gender"
    t.string   "email"
    t.string   "password"
    t.string   "pictureref"
    t.integer  "user_type_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "twitter",        :default => false
  end

  add_index "users", ["user_type_id"], :name => "index_users_on_user_type_id"

end
