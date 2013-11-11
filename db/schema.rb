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

ActiveRecord::Schema.define(:version => 20131111072732) do

  create_table "fields", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "subject_id"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.string   "posted_by"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "topic_id"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "resource_id"
    t.string   "user"
    t.text     "content"
    t.integer  "rating"
    t.boolean  "anonymous"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "reviews", ["resource_id"], :name => "index_reviews_on_resource_id"

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "field_id"
    t.text     "description"
  end

end
