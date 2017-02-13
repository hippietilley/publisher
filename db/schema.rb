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

ActiveRecord::Schema.define(version: 20170213213821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "activity_type"
    t.string   "amount"
    t.string   "unit"
    t.string   "converted_amount"
    t.string   "converted_unit"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "activity_verb"
  end

  create_table "articles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.text     "bookmark_author"
    t.text     "bookmark_excerpt"
    t.text     "bookmark_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "events", force: :cascade do |t|
    t.text     "summary"
    t.text     "url"
    t.text     "organizer_name"
    t.text     "organizer_url"
    t.text     "location_name"
    t.text     "location_url"
    t.text     "location_street_address"
    t.text     "location_extended_street_address"
    t.text     "location_locality"
    t.text     "location_region"
    t.text     "location_country"
    t.text     "location_postal_code"
    t.text     "location_latitude"
    t.text     "location_longitude"
    t.text     "location_altitude"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.string   "name"
    t.string   "short_code"
    t.text     "description"
    t.text     "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "links", force: :cascade do |t|
    t.text     "url"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.boolean  "show_in_nav"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "hide_header", default: false
    t.boolean  "hide_footer", default: false
    t.boolean  "hide_layout", default: false
  end

  create_table "photos", force: :cascade do |t|
    t.text     "image_url"
    t.integer  "width"
    t.integer  "height"
    t.datetime "captured_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "title"
    t.text     "subtitle"
    t.text     "content"
    t.text     "slug"
    t.text     "in_reply_to"
    t.boolean  "private",        default: false
    t.datetime "published_at"
    t.integer  "post_type_id"
    t.string   "post_type_type"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id",        default: 1
  end

  create_table "providers", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["provider", "user_id"], name: "index_providers_on_provider_and_user_id", using: :btree
  end

  create_table "redirects", force: :cascade do |t|
    t.text     "source_path"
    t.text     "target_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.boolean  "editable",   default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.text     "image_url"
    t.integer  "duration"
    t.datetime "captured_at"
    t.text     "enclosure_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "syndications", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "name"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "namespace"
    t.string   "predicate"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.text     "url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "avatar"
    t.string   "phone"
  end

  create_table "videos", force: :cascade do |t|
    t.text     "image_url"
    t.integer  "width"
    t.integer  "height"
    t.integer  "duration"
    t.datetime "captured_at"
    t.text     "enclosure_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
