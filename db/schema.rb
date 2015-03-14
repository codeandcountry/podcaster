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

ActiveRecord::Schema.define(version: 20150306040456) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "episodes", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.string   "subtitle",         limit: 255
    t.text     "summary",          limit: 65535
    t.string   "url",              limit: 255
    t.string   "length",           limit: 255
    t.string   "author",           limit: 255
    t.string   "link",             limit: 255
    t.string   "guid",             limit: 255
    t.datetime "published"
    t.string   "keywords",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "feed_id",          limit: 4
    t.string   "categories",       limit: 255
    t.string   "mp3_file_name",    limit: 255
    t.string   "mp3_content_type", limit: 255
    t.integer  "mp3_file_size",    limit: 4
    t.datetime "mp3_updated_at"
  end

  add_index "episodes", ["feed_id"], name: "index_episodes_on_feed_id", using: :btree

  create_table "feeds", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.text     "description",     limit: 65535
    t.string   "slug",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "atom_link",       limit: 255
    t.string   "link",            limit: 255
    t.string   "subtitle",        limit: 255
    t.string   "summary",         limit: 255
    t.string   "language",        limit: 255
    t.string   "copyright",       limit: 255
    t.string   "owner_name",      limit: 255
    t.string   "owner_email",     limit: 255
    t.datetime "last_build_date"
    t.datetime "published_date"
    t.string   "ttl",             limit: 255
    t.string   "skip_days",       limit: 255
    t.string   "generator",       limit: 255
    t.string   "docs",            limit: 255
    t.string   "author",          limit: 255
    t.string   "image_url",       limit: 255
    t.string   "image_title",     limit: 255
    t.string   "image_width",     limit: 255
    t.string   "image_height",    limit: 255
    t.string   "image_link",      limit: 255
    t.boolean  "is_explicit",     limit: 1
    t.string   "categories",      limit: 255
    t.boolean  "uses_podtrac",    limit: 1
    t.string   "ftp_folder_path", limit: 255
    t.string   "ftp_folder_url",  limit: 255
  end

  add_index "feeds", ["slug"], name: "index_feeds_on_slug", unique: true, using: :btree

end
