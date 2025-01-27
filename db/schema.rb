# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_29_115752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "host_email"
    t.string "category"
    t.boolean "toilets"
    t.boolean "showers"
    t.boolean "lunch_bag"
    t.boolean "breakfast"
    t.boolean "dinner"
    t.float "longitude"
    t.float "latitude"
    t.integer "price_per_night"
    t.integer "capacity"
    t.bigint "trail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_accommodations_on_trail_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "itineraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trail_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_itineraries_on_trail_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "accommodation_id", null: false
    t.date "checkin_date"
    t.float "total_price"
    t.boolean "booked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "guests"
    t.index ["accommodation_id"], name: "index_reservations_on_accommodation_id"
    t.index ["itinerary_id"], name: "index_reservations_on_itinerary_id"
  end

  create_table "trail_stages", force: :cascade do |t|
    t.string "name"
    t.integer "stage_number"
    t.float "longitude"
    t.float "latitude"
    t.integer "distance_from_last"
    t.integer "ascend_from_last"
    t.integer "descend_from_last"
    t.bigint "trail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_trail_stages_on_trail_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.integer "distance"
    t.string "number_of_days"
    t.string "elevation_range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "trail_outline"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accommodations", "trails"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "itineraries", "trails"
  add_foreign_key "itineraries", "users"
  add_foreign_key "reservations", "accommodations", column: "accommodation_id"
  add_foreign_key "reservations", "itineraries"
  add_foreign_key "trail_stages", "trails"
end
