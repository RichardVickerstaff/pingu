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

ActiveRecord::Schema.define(version: 20140813135027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pings", force: true do |t|
    t.integer "response_ms"
    t.integer "run_id"
    t.integer "site_id"
  end

  create_table "probes", force: true do |t|
    t.string "uid"
    t.string "location"
    t.string "ip"
  end

  create_table "runs", force: true do |t|
    t.integer  "probe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_groups", force: true do |t|
    t.string "name"
  end

  create_table "sites", force: true do |t|
    t.string  "url"
    t.integer "site_group_id"
  end

end
