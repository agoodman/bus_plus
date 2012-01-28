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

ActiveRecord::Schema.define(:version => 20101224022339) do

  create_table "drivers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "license_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "passengers", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "passenger_id"
    t.float    "start_latitude"
    t.float    "start_longitude"
    t.datetime "start_time"
    t.float    "end_latitude"
    t.float    "end_longitude"
    t.datetime "end_time"
    t.integer  "vehicle_id"
  end

  create_table "vehicles", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "seats_available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "driver_id"
  end

end
