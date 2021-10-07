class CreateStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :starships do |t|
      t.string :mglt
      t.string :cargo_capacity
      t.string :consumables
      t.string :cost_in_credits
      t.string :created
      t.string :crew
      t.string :edited
      t.string :hyperdrive_rating
      t.string :length
      t.string :manufacturer
      t.string :max_atmosphering_speed
      t.string :model
      t.string :name
      t.string :passengers
      t.string :starship_class

      t.timestamps
    end
  end
end
