class Specie < ApplicationRecord
  has_many :person_species, class_name: "PersonSpecie"
  has_many :people, through: :person_species, source: :person
end
