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

ActiveRecord::Schema.define(version: 20141228062220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content"
    t.text     "path"
    t.integer  "user_id"
    t.datetime "edited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["path"], name: "index_articles_on_path", using: :btree
  add_index "articles", ["title"], name: "index_articles_on_title", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "user_settings", force: :cascade do |t|
    t.string   "repository"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_settings", ["user_id"], name: "index_user_settings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "screen_name",  null: false
    t.string   "github_id",    null: false
    t.string   "github_token", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "avatar_url"
  end

  add_index "users", ["github_id"], name: "index_users_on_github_id", unique: true, using: :btree
  add_index "users", ["screen_name"], name: "index_users_on_screen_name", unique: true, using: :btree

  create_table "webhook_events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "github_delivery_id"
    t.string   "ref"
    t.string   "head_commit_id"
    t.text     "payload_json"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "webhook_events", ["user_id"], name: "index_webhook_events_on_user_id", using: :btree

end
