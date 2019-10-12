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

ActiveRecord::Schema.define(version: 2019_10_11_085015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.text "content", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "estimate_amounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "month", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year", null: false
    t.index ["user_id"], name: "index_estimate_amounts_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_favorites_on_review_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "review_id", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
    t.index ["review_id"], name: "index_images_on_review_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memos", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "record_id", null: false
    t.index ["record_id"], name: "index_memos_on_record_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_products_on_record_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "store_name", null: false
    t.bigint "user_id", null: false
    t.integer "purchase_price", null: false
    t.date "purchase_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "label_id", null: false
    t.index ["label_id"], name: "index_records_on_label_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "estimate_amounts", "users"
  add_foreign_key "favorites", "reviews"
  add_foreign_key "favorites", "users"
  add_foreign_key "images", "products"
  add_foreign_key "products", "records"
  add_foreign_key "records", "labels"
  add_foreign_key "records", "users"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
