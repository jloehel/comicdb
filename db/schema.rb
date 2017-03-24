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

ActiveRecord::Schema.define(version: 20170323154300) do

  create_table "author_jobs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "surname"
    t.string   "lastname"
    t.date     "birthday"
    t.date     "deathday"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comics", force: :cascade do |t|
    t.string   "ISBN13"
    t.string   "ISBN10"
    t.string   "title"
    t.date     "release_date"
    t.integer  "edition"
    t.string   "language"
    t.string   "format"
    t.string   "shape"
    t.integer  "pages"
    t.decimal  "price"
    t.text     "description"
    t.boolean  "borrowed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comics_has_authors", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "comic_id"
    t.integer  "author_job_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comics_has_authors", ["author_id"], name: "index_comics_has_authors_on_author_id"
  add_index "comics_has_authors", ["author_job_id"], name: "index_comics_has_authors_on_author_job_id"
  add_index "comics_has_authors", ["comic_id"], name: "index_comics_has_authors_on_comic_id"

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "address"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
