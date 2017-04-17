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

ActiveRecord::Schema.define(version: 20170330012228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :integer, force: :cascade do |t|
    t.text     "namespace"
    t.text     "body"
    t.text     "resource_id",   null: false
    t.text     "resource_type", null: false
    t.text     "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", id: :integer, force: :cascade do |t|
    t.text     "email",                  default: "", null: false
    t.text     "encrypted_password",     default: "", null: false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "attachments", id: :integer, force: :cascade do |t|
    t.integer  "parent_id",   null: false
    t.text     "parent_type", null: false
    t.text     "token"
    t.text     "file",        null: false
    t.text     "file_name"
    t.integer  "file_size"
    t.text     "file_type"
    t.text     "role"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", id: :integer, force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", id: :integer, force: :cascade do |t|
    t.text     "name"
    t.text     "sku"
    t.text     "description"
    t.boolean  "active",                                default: false
    t.decimal  "weight",        precision: 8, scale: 3, default: "0.0"
    t.decimal  "price",         precision: 8, scale: 2, default: "0.0"
    t.decimal  "cost_price",    precision: 8, scale: 2, default: "0.0"
    t.integer  "tax_rate_id"
    t.boolean  "on_sale",                               default: false
    t.boolean  "featured",                              default: false
    t.boolean  "stock_control",                         default: true
    t.text     "image"
    t.integer  "category_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

end
