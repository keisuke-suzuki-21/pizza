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

ActiveRecord::Schema.define(version: 2021_12_27_062019) do

  create_table "mainmenus", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "size"
    t.boolean "recommend", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "password", null: false
    t.string "adress", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.integer "point"
    t.string "fullname", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "mainmenu_id", null: false
    t.integer "topping_id", null: false
    t.string "name", null: false
    t.index ["mainmenu_id"], name: "index_recipes_on_mainmenu_id"
    t.index ["topping_id"], name: "index_recipes_on_topping_id"
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
