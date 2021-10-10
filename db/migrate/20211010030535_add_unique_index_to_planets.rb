class AddUniqueIndexToPlanets < ActiveRecord::Migration[6.1]
  def change
    add_index :planets, :name, unique: true
  end
end
