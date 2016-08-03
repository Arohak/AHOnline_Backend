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

ActiveRecord::Schema.define(version: 20160802175923) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.index ["category_id"], name: "index_category_translations_on_category_id"
    t.index ["locale"], name: "index_category_translations_on_locale"
  end

  create_table "categoryitems", force: :cascade do |t|
    t.integer  "categoryitem_id"
    t.integer  "rest_id"
    t.integer  "restaurant_id"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string   "city"
    t.string   "alias"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveryaddresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.boolean  "def"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "rest_id"
    t.integer  "categoryitem_id"
    t.integer  "menu"
    t.integer  "restaurant_menu_categories"
    t.boolean  "new"
    t.string   "label"
    t.string   "content"
    t.integer  "item_number"
    t.integer  "inventory"
    t.integer  "instock"
    t.integer  "desired_stock"
    t.string   "price"
    t.string   "type_"
    t.string   "alias"
    t.string   "keywords"
    t.string   "src"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
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

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "email"
    t.string   "mobile_number"
    t.string   "verification_code"
    t.boolean  "is_verified"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
