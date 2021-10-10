class Person < ApplicationRecord
  belongs_to :homeworld, foreign_key: :planet_id, class_name: "Planet", inverse_of: :residents

  has_many :person_species, class_name: "PersonSpecie", dependent: :destroy
  has_many :species, through: :person_species, source: :specie
  has_many :person_starships, dependent: :destroy
  has_many :starships, through: :person_starships

  validates :name, uniqueness: true
end
