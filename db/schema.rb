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

ActiveRecord::Schema.define(version: 20140508205529) do

  create_table "collections", force: true do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "description"
  end

  create_table "collections_photos", id: false, force: true do |t|
    t.integer "collection_id"
    t.integer "photo_id"
  end

  create_table "collections_tags", force: true do |t|
    t.integer "collection_id"
    t.integer "tag_id"
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.string   "commentable_type"
    t.integer  "commentable_id"
  end

  create_table "photos", force: true do |t|
    t.string "photo_upload"
  end

  create_table "photos_tags", force: true do |t|
    t.integer "photo_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "terms"
  end

end
