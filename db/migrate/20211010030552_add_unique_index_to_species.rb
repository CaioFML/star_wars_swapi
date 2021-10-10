class AddUniqueIndexToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_index :species, :name, unique: true
  end
end
