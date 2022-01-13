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

ActiveRecord::Schema.define(version: 2022_01_13_072630) do

  create_table "administrators", force: :cascade do |t|
    t.string "password_digest", null: false
    t.string "name", null: false
  end

  create_table "mainmenus", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "size"
    t.boolean "recommend", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.string "phone"
    t.string "email"
    t.integer "point"
    t.string "fullname"
    t.string "password_digest"
  end

  create_table "order_sidemenus", force: :cascade do |t|
    t.integer "order_id"
    t.integer "sidemenu_id"
    t.index ["order_id"], name: "index_order_sidemenus_on_order_id"
    t.index ["sidemenu_id"], name: "index_order_sidemenus_on_sidemenu_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "address"
    t.time "time"
    t.integer "price"
    t.boolean "case", default: false, null: false
    t.boolean "cart", default: false, null: false
    t.string "session"
    t.integer "member_id", null: false
    t.index ["member_id"], name: "index_orders_on_member_id"
  end

  create_table "product_toppings", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "topping_id", null: false
    t.index ["product_id"], name: "index_product_toppings_on_product_id"
    t.index ["topping_id"], name: "index_product_toppings_on_topping_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "mainmenu_id"
    t.integer "order_id"
    t.integer "price"
    t.index ["mainmenu_id"], name: "index_products_on_mainmenu_id"
    t.index ["order_id"], name: "index_products_on_order_id"
  end

  create_table "recipe_toppings", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "topping_id", null: false
    t.index ["recipe_id"], name: "index_recipe_toppings_on_recipe_id"
    t.index ["topping_id"], name: "index_recipe_toppings_on_topping_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "mainmenu_id", null: false
    t.string "name", null: false
    t.index ["mainmenu_id"], name: "index_recipes_on_mainmenu_id"
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
  end

end
