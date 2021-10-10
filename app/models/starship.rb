class Starship < ApplicationRecord
  has_many :person_starships, dependent: :destroy
  has_many :people, through: :person_starships

  validates :name, uniqueness: true
end
