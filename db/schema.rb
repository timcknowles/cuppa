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

ActiveRecord::Schema.define(:version => 20130406134306) do

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "venue"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "places_available"
  end

  create_table "home_trusts", :force => true do |t|
    t.string   "trust"
    t.string   "hospital"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "trust"
    t.string   "hospital"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "registrations", :force => true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "feedback_form_completed", :default => false
    t.boolean  "certificate_sent",        :default => false
    t.boolean  "paid",                    :default => false
    t.boolean  "waiting_list",            :default => false
  end

  add_index "registrations", ["course_id"], :name => "index_registrations_on_course_id"
  add_index "registrations", ["user_id"], :name => "index_registrations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.boolean  "admin",           :default => false, :null => false
    t.string   "trust"
    t.string   "hospital"
    t.string   "last_name"
  end

end
