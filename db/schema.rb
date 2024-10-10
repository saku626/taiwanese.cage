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

ActiveRecord::Schema[7.0].define(version: 2024_08_24_230249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "default_vocabulary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_bookmarks_on_category_id"
    t.index ["default_vocabulary_id"], name: "index_bookmarks_on_default_vocabulary_id"
    t.index ["user_id", "default_vocabulary_id"], name: "index_bookmarks_on_user_id_and_default_vocabulary_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "default_vocabularies", force: :cascade do |t|
    t.string "title", null: false
    t.string "bopomofo", null: false
    t.string "mean", null: false
    t.text "body"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_default_vocabularies_on_category_id"
    t.index ["user_id"], name: "index_default_vocabularies_on_user_id"
  end

  create_table "task_completions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "date"], name: "index_task_completions_on_user_id_and_date", unique: true
    t.index ["user_id"], name: "index_task_completions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_login_at"
    t.datetime "last_vocabulary_created_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "vocabularies", force: :cascade do |t|
    t.string "title", null: false
    t.string "bopomofo", null: false
    t.string "mean", null: false
    t.text "body"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_vocabularies_on_category_id"
    t.index ["user_id"], name: "index_vocabularies_on_user_id"
  end

  add_foreign_key "bookmarks", "categories"
  add_foreign_key "bookmarks", "default_vocabularies"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "default_vocabularies", "categories"
  add_foreign_key "default_vocabularies", "users"
  add_foreign_key "task_completions", "users"
  add_foreign_key "vocabularies", "categories"
  add_foreign_key "vocabularies", "users"
end
