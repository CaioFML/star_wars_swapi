class Person < ApplicationRecord
  belongs_to :homeworld, foreign_key: :planet_id, class_name: "Planet"

  has_many :person_species, class_name: "PersonSpecie"
  has_many :species, through: :person_species, source: :specie
end
