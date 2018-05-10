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

ActiveRecord::Schema.define(version: 2018_05_10_150938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "building"
    t.string "apartment"
    t.string "comment"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.json "schedule"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "cities_products", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "city_id", null: false
  end

  create_table "cities_toppings", id: false, force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "topping_id", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "option_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_option_names_on_category_id"
  end

  create_table "option_values", force: :cascade do |t|
    t.string "value"
    t.bigint "option_name_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_name_id"], name: "index_option_values_on_option_name_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_instance_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_instance_id"], name: "index_order_products_on_product_instance_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "payment_method"
    t.integer "status"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
  end

  create_table "product_instances", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_instances_on_product_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.bigint "product_instance_id"
    t.bigint "option_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_value_id"], name: "index_product_options_on_option_value_id"
    t.index ["product_instance_id"], name: "index_product_options_on_product_instance_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_taggings_on_product_id"
    t.index ["subcategory_id"], name: "index_taggings_on_subcategory_id"
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_toppings_on_category_id"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "cities", "countries"
  add_foreign_key "option_names", "categories"
  add_foreign_key "option_values", "option_names"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "product_instances"
  add_foreign_key "orders", "addresses"
  add_foreign_key "product_instances", "products"
  add_foreign_key "product_options", "option_values"
  add_foreign_key "product_options", "product_instances"
  add_foreign_key "products", "categories"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "taggings", "products"
  add_foreign_key "taggings", "subcategories"
  add_foreign_key "toppings", "categories"
end
