class CreatePersonSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :person_species do |t|
      t.references :person, null: false, foreign_key: true
      t.references :specie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
