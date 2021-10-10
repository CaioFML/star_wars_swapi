class AddUniqueIndexToStarships < ActiveRecord::Migration[6.1]
  def change
    add_index :starships, :name, unique: true
  end
end
