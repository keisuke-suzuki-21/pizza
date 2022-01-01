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

ActiveRecord::Schema.define(version: 2021_12_30_012822) do

  create_table "mainmenus", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "size"
    t.boolean "recommend", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "adress", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.integer "point"
    t.string "fullname", null: false
    t.string "password_digest"
  end

  create_table "order_sidemenus", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "sidemenu_id", null: false
    t.index ["order_id"], name: "index_order_sidemenus_on_order_id"
    t.index ["sidemenu_id"], name: "index_order_sidemenus_on_sidemenu_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "address", null: false
    t.string "time", null: false
    t.integer "price", null: false
    t.string "case", null: false
    t.boolean "cart", null: false
    t.string "session"
    t.integer "member_id", null: false
    t.index ["member_id"], name: "index_orders_on_member_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "sidemenus", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "size"
    t.boolean "recommend", null: false
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name", null: false
    t.integer "stock", null: false
    t.integer "price", null: false
    t.integer "mainmenu_id"
    t.index ["mainmenu_id"], name: "index_toppings_on_mainmenu_id"
  end

end
