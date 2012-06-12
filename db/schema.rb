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

ActiveRecord::Schema.define(:version => 20120611164515) do

  create_table "line_items", :force => true do |t|
    t.integer "amount_needed"
    t.integer "amount_given"
    t.integer "order_id"
    t.integer "product_id"
  end

  create_table "orders", :force => true do |t|
    t.string "number"
    t.text   "comment"
    t.string "state"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo_url"
    t.integer  "stock"
    t.decimal  "price"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "removed"
    t.integer  "product_number"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

end
