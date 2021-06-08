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

ActiveRecord::Schema.define(version: 2021_06_08_051004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string "equipment", null: false
    t.string "name", null: false
    t.string "numeral"
    t.string "identification"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_accessories_on_order_id"
  end

  create_table "attachements", force: :cascade do |t|
    t.binary "file"
    t.string "image"
    t.string "title"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_attachements_on_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "numeral"
    t.string "identification"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "order_overviews", force: :cascade do |t|
    t.string "company", null: false
    t.string "department", null: false
    t.string "position"
    t.string "name", null: false
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_overviews_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity", null: false
    t.text "remarks"
    t.integer "delivery", null: false
    t.date "acceptance_on", null: false
    t.boolean "quotation", default: false, null: false
    t.boolean "carry", default: true, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "company_code", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accessories", "orders"
  add_foreign_key "attachements", "orders"
  add_foreign_key "items", "orders"
  add_foreign_key "order_overviews", "orders"
  add_foreign_key "orders", "users"
end
