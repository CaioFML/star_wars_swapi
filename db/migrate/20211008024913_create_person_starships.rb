class CreatePersonStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :person_starships do |t|
      t.references :person, null: false, foreign_key: true
      t.references :starship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
