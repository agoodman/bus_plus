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

ActiveRecord::Schema.define(:version => 20121209230542) do

  create_table "candidates", :force => true do |t|
    t.integer   "vehicle_id"
    t.integer   "passenger_id"
    t.float     "bid"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "assigned_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer   "priority",   :default => 0
    t.integer   "attempts",   :default => 0
    t.text      "handler"
    t.text      "last_error"
    t.timestamp "run_at"
    t.timestamp "locked_at"
    t.timestamp "failed_at"
    t.string    "locked_by"
    t.string    "queue"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "drivers", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "license_number"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "email"
  end

  create_table "manifests", :force => true do |t|
    t.integer   "vehicle_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "manifests_path_elements", :id => false, :force => true do |t|
    t.integer "manifest_id"
    t.integer "path_element_id"
  end

  create_table "passengers", :force => true do |t|
    t.float     "start_latitude"
    t.float     "start_longitude"
    t.float     "end_latitude"
    t.float     "end_longitude"
    t.integer   "vehicle_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "position"
    t.timestamp "assigned_at"
    t.string    "token"
    t.datetime  "pickup_at"
    t.datetime  "dropoff_at"
  end

  create_table "path_elements", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "passenger_id"
    t.float     "start_latitude"
    t.float     "start_longitude"
    t.timestamp "start_time"
    t.float     "end_latitude"
    t.float     "end_longitude"
    t.timestamp "end_time"
  end

  create_table "vehicles", :force => true do |t|
    t.float     "latitude"
    t.float     "longitude"
    t.integer   "seats_available"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "driver_id"
    t.boolean   "on_duty"
    t.string    "token"
  end

  create_table "waypoints", :force => true do |t|
    t.float     "latitude"
    t.float     "longitude"
    t.timestamp "arrival_time"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "manifest_id"
  end

end
