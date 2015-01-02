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

ActiveRecord::Schema.define(version: 20150103143325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "snippets", force: true do |t|
    t.integer  "track_id"
    t.integer  "user_id",    null: false
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: true do |t|
    t.integer  "user_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.string   "permalink_url"
    t.string   "artwork_url"
    t.string   "description"
    t.integer  "duration"
    t.string   "waveform_url"
    t.integer  "bpm"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "provider",                        null: false
    t.string   "uid",                             null: false
    t.string   "token",                           null: false
    t.string   "profile_img_url",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                           null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "sound_cloud_id"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree

end
