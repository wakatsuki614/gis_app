# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_01_085837) do

  create_table "likes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.string "ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_likes_on_review_id"
  end

  create_table "reviews", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "school_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_reviews_on_school_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "schools", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "school_name"
    t.string "school_email"
    t.string "image"
    t.string "introduce"
    t.string "address"
    t.string "phone"
    t.string "home_page"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_email"], name: "index_schools_on_school_email", unique: true
    t.index ["user_id"], name: "index_schools_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "likes", "reviews"
  add_foreign_key "reviews", "schools"
  add_foreign_key "reviews", "users"
  add_foreign_key "schools", "users"
end
