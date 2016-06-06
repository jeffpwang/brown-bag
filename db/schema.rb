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

ActiveRecord::Schema.define(version: 20160311181614) do

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.decimal  "goal_amount",   precision: 10, scale: 2
    t.decimal  "saved_amount",  precision: 10, scale: 2, default: 0.0
    t.integer  "goal_progress",                          default: 0
    t.boolean  "goal_met",                               default: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.string   "category"
    t.decimal  "amount",     precision: 5, scale: 2
    t.integer  "goal_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
