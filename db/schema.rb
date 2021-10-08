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

ActiveRecord::Schema.define(version: 2021_10_07_001821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "starships", force: :cascade do |t|
    t.string "mglt"
    t.string "cargo_capacity"
    t.string "consumables"
    t.string "cost_in_credits"
    t.string "created"
    t.string "crew"
    t.string "edited"
    t.string "hyperdrive_rating"
    t.string "length"
    t.string "manufacturer"
    t.string "max_atmosphering_speed"
    t.string "model"
    t.string "name"
    t.string "passengers"
    t.string "starship_class"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
