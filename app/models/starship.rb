class Starship < ApplicationRecord
  has_many :person_starships, dependent: :destroy
  has_many :people, through: :person_starships
end
