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

ActiveRecord::Schema[8.0].define(version: 2025_04_15_070025) do
  create_table "contact_requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "appointment_date", precision: nil
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_contact_requests_on_property_id"
  end

  create_table "details", force: :cascade do |t|
    t.decimal "rental_price", precision: 12, scale: 2
    t.decimal "management_fee", precision: 12, scale: 2
    t.string "deposit"
    t.decimal "key_fee", precision: 12, scale: 2
    t.string "property_type"
    t.date "built_date"
    t.string "address"
    t.text "transportation_info"
    t.string "floor_plan"
    t.decimal "area", precision: 8, scale: 2
    t.text "layout_details"
    t.string "orientation"
    t.string "floor_info"
    t.decimal "parking_fee", precision: 12, scale: 2
    t.text "features"
    t.decimal "cleaning_fee", precision: 12, scale: 2
    t.decimal "key_card_fee", precision: 12, scale: 2
    t.decimal "renewal_fee", precision: 12, scale: 2
    t.string "contract_duration"
    t.string "move_in_info"
    t.text "initial_cost"
    t.text "housing_insurance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id", null: false
    t.index ["property_id"], name: "index_details_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "location"
    t.decimal "price"
    t.integer "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_phone"
    t.integer "built_year"
  end

  add_foreign_key "contact_requests", "properties"
  add_foreign_key "details", "properties"
end
