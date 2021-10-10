class AddUniqueIndexToPeople < ActiveRecord::Migration[6.1]
  def change
    add_index :people, :name, unique: true
  end
end
