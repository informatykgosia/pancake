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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120221220231) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "drpancakes", :force => true do |t|
    t.string   "title"
    t.text     "theory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "nazwa"
    t.string   "kategoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients_pancakes", :id => false, :force => true do |t|
    t.integer "ingredient_id"
    t.integer "pancake_id"
  end

  create_table "lokals", :force => true do |t|
    t.string   "nazwa"
    t.string   "adres"
    t.float    "ocena"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "opis"
  end

  create_table "pancakes", :force => true do |t|
    t.string   "polewa"
    t.float    "ocena"
    t.float    "cena"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lokal_id"
    t.string   "nazwa"
    t.string   "opis"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "imie"
    t.string   "nazwisko"
    t.string   "crypted_password"
    t.string   "email"
    t.string   "rodzaj"
    t.string   "adres"
    t.string   "persistence_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
