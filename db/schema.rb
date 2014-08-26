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

ActiveRecord::Schema.define(version: 20140826014853) do

  create_table "documents", force: true do |t|
    t.string   "path"
    t.string   "rev"
    t.integer  "revision"
    t.integer  "bytes"
    t.string   "size"
    t.boolean  "is_deleted"
    t.integer  "user_id"
    t.datetime "edited_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["user_id", "path"], name: "index_documents_on_user_id_and_path", unique: true

  create_table "identities", force: true do |t|
    t.string   "username"
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_token"
    t.string   "access_token_secret"
  end

  add_index "identities", ["uid", "provider"], name: "index_identities_on_uid_and_provider", unique: true
  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
