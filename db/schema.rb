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

ActiveRecord::Schema.define(version: 2021_10_10_030552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "eye_color"
    t.string "gender"
    t.string "hair_color"
    t.string "height"
    t.string "mass"
    t.string "skin_color"
    t.bigint "planet_id"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_people_on_name", unique: true
    t.index ["planet_id"], name: "index_people_on_planet_id"
  end

  create_table "person_species", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "specie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_person_species_on_person_id"
    t.index ["specie_id"], name: "index_person_species_on_specie_id"
  end

  create_table "person_starships", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "starship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_person_starships_on_person_id"
    t.index ["starship_id"], name: "index_person_starships_on_starship_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "diameter"
    t.string "rotation_period"
    t.string "orbital_period"
    t.string "gravity"
    t.string "population"
    t.string "climate"
    t.string "terrain"
    t.string "surface_water"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_planets_on_name", unique: true
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.string "average_height"
    t.string "average_lifespan"
    t.string "eye_colors"
    t.string "hair_colors"
    t.string "skin_colors"
    t.string "language"
    t.string "people"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_species_on_name", unique: true
  end

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
    t.index ["name"], name: "index_starships_on_name", unique: true
  end

  add_foreign_key "person_species", "people"
  add_foreign_key "person_species", "species", column: "specie_id"
  add_foreign_key "person_starships", "people"
  add_foreign_key "person_starships", "starships"
end
