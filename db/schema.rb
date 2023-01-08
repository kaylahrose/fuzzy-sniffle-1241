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

ActiveRecord::Schema.define(version: 2023_01_08_232411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "chef_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chef_id"], name: "index_dishes_on_chef_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "dish_id"
    t.index ["dish_id"], name: "index_recipes_on_dish_id"
    t.index ["ingredient_id"], name: "index_recipes_on_ingredient_id"
  end

  add_foreign_key "dishes", "chefs"
  add_foreign_key "recipes", "dishes"
  add_foreign_key "recipes", "ingredients"
end
