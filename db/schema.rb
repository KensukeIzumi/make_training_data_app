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

ActiveRecord::Schema.define(version: 20150919132047) do

  create_table "categolized_images", force: :cascade do |t|
    t.integer  "start_x",           limit: 4
    t.integer  "start_y",           limit: 4
    t.integer  "end_x",             limit: 4
    t.integer  "end_y",             limit: 4
    t.string   "name",              limit: 255
    t.integer  "user_id",           limit: 4
    t.integer  "prepared_image_id", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "evaluation",        limit: 4,   default: 0
  end

  add_index "categolized_images", ["prepared_image_id"], name: "index_categolized_images_on_prepared_image_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "categolized_image_id", limit: 4
  end

  create_table "prepared_images", force: :cascade do |t|
    t.string   "image_resource", limit: 255
    t.integer  "view_count",     limit: 4,   default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image",          limit: 255
    t.integer  "delete_flag",    limit: 4,   default: 0
  end

  create_table "reported_images", force: :cascade do |t|
    t.integer  "prepared_iamge_id", limit: 4
    t.integer  "report_count",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "prepared_image_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "training_images", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "categolize_count",       limit: 4,   default: 0
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "username",               limit: 255
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categolized_images", "prepared_images"
end
