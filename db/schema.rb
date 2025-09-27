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

ActiveRecord::Schema[7.2].define(version: 2025_09_20_125638) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "noshi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["noshi_id"], name: "index_bookmarks_on_noshi_id"
    t.index ["user_id", "noshi_id"], name: "index_bookmarks_on_user_id_and_noshi_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "use_case", null: false
    t.string "religion", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["use_case", "religion"], name: "index_categories_on_use_case_and_religion", unique: true
  end

  create_table "column_synonyms", force: :cascade do |t|
    t.bigint "column_id"
    t.bigint "synonym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id", "synonym_id"], name: "index_column_synonyms_on_column_id_and_synonym_id", unique: true
    t.index ["column_id"], name: "index_column_synonyms_on_column_id"
    t.index ["synonym_id"], name: "index_column_synonyms_on_synonym_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string "title", null: false
    t.string "text", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "noshi_columns", force: :cascade do |t|
    t.bigint "noshi_id"
    t.bigint "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_noshi_columns_on_column_id"
    t.index ["noshi_id", "column_id"], name: "index_noshi_columns_on_noshi_id_and_column_id", unique: true
    t.index ["noshi_id"], name: "index_noshi_columns_on_noshi_id"
  end

  create_table "noshi_synonyms", force: :cascade do |t|
    t.bigint "noshi_id"
    t.bigint "synonym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["noshi_id", "synonym_id"], name: "index_noshi_synonyms_on_noshi_id_and_synonym_id", unique: true
    t.index ["noshi_id"], name: "index_noshi_synonyms_on_noshi_id"
    t.index ["synonym_id"], name: "index_noshi_synonyms_on_synonym_id"
  end

  create_table "noshi_tags", force: :cascade do |t|
    t.bigint "noshi_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["noshi_id", "tag_id"], name: "index_noshi_tags_on_noshi_id_and_tag_id", unique: true
    t.index ["noshi_id"], name: "index_noshi_tags_on_noshi_id"
    t.index ["tag_id"], name: "index_noshi_tags_on_tag_id"
  end

  create_table "noshis", force: :cascade do |t|
    t.string "label", null: false
    t.string "knot", null: false
    t.string "color", null: false
    t.string "description", null: false
    t.string "image", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_noshis_on_category_id"
  end

  create_table "synonyms", force: :cascade do |t|
    t.string "word", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word"], name: "index_synonyms_on_word", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "noshis"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "column_synonyms", "columns"
  add_foreign_key "column_synonyms", "synonyms"
  add_foreign_key "noshi_columns", "columns"
  add_foreign_key "noshi_columns", "noshis"
  add_foreign_key "noshi_synonyms", "noshis"
  add_foreign_key "noshi_synonyms", "synonyms"
  add_foreign_key "noshi_tags", "noshis"
  add_foreign_key "noshi_tags", "tags"
  add_foreign_key "noshis", "categories"
end
