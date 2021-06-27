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

ActiveRecord::Schema.define(version: 2021_06_16_003242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contractors", force: :cascade do |t|
    t.integer "price", null: false
    t.integer "tax", null: false
    t.integer "total", null: false
    t.date "due_on", null: false
    t.bigint "order_confirmation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_confirmation_id"], name: "index_contractors_on_order_confirmation_id"
  end

  create_table "order_confirmations", force: :cascade do |t|
    t.string "firm", null: false
    t.string "department", null: false
    t.string "position"
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.bigint "purchase_id"
    t.date "acceptance_on"
    t.index ["purchase_id"], name: "index_order_confirmations_on_purchase_id"
    t.index ["user_id"], name: "index_order_confirmations_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "parts", null: false
    t.string "equipment", null: false
    t.string "numeral"
    t.string "identification"
    t.string "quantity", null: false
    t.text "remarks"
    t.bigint "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_orders_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "firm", null: false
    t.string "department", null: false
    t.string "position"
    t.string "name", null: false
    t.date "acceptance_on", null: false
    t.string "delivery", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
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

  add_foreign_key "contractors", "order_confirmations"
  add_foreign_key "order_confirmations", "purchases"
  add_foreign_key "order_confirmations", "users"
  add_foreign_key "orders", "purchases"
  add_foreign_key "purchases", "users"
end
