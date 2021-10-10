class Specie < ApplicationRecord
  has_many :person_species, class_name: "PersonSpecie", dependent: :destroy
  has_many :people, through: :person_species, source: :person

  validates :name, uniqueness: true
end
