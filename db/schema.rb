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

ActiveRecord::Schema.define(version: 20160712214110) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoryitems", force: :cascade do |t|
    t.integer  "categoryitem_id"
    t.integer  "rest_id"
    t.integer  "restaurant_id"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "label"
    t.text     "description"
    t.text     "hash_"
    t.string   "status"
    t.integer  "position"
    t.string   "budget"
    t.string   "openTime"
    t.string   "closeTime"
    t.string   "src"
    t.integer  "min_amount_order"
    t.integer  "rate"
    t.integer  "totalHours"
    t.integer  "around"
    t.boolean  "new"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "restaurants_subcategories", id: false, force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "subcategory_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer  "shop_id"
    t.integer  "category_id"
    t.integer  "rate"
    t.string   "budget"
    t.boolean  "new"
    t.integer  "min_amount_order"
    t.text     "hash_"
    t.integer  "position"
    t.text     "description"
    t.string   "label"
    t.integer  "totalHours"
    t.string   "openTime"
    t.string   "closeTime"
    t.integer  "around"
    t.string   "status"
    t.string   "src"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.string   "name"
    t.string   "title"
    t.integer  "position"
    t.string   "src"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end