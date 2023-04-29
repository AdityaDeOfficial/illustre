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

ActiveRecord::Schema[7.0].define(version: 2023_04_29_015752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "manga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_bookmarks_on_manga_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "chapter_reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chapter_id", null: false
    t.float "rating"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_chapter_reviews_on_chapter_id"
    t.index ["user_id"], name: "index_chapter_reviews_on_user_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.bigint "manga_id", null: false
    t.string "chapter_title"
    t.integer "chapter_number"
    t.json "pdf_upload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_chapters_on_manga_id"
  end

  create_table "manga_reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "manga_id", null: false
    t.float "rating"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_manga_reviews_on_manga_id"
    t.index ["user_id"], name: "index_manga_reviews_on_user_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "manga_title"
    t.text "description"
    t.bigint "user_id", null: false
    t.json "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mangas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "mangas"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "chapter_reviews", "chapters"
  add_foreign_key "chapter_reviews", "users"
  add_foreign_key "chapters", "mangas"
  add_foreign_key "manga_reviews", "mangas"
  add_foreign_key "manga_reviews", "users"
  add_foreign_key "mangas", "users"
end
