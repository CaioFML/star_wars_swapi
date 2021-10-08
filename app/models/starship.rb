class Starship < ApplicationRecord
  has_many :person_starships
  has_many :people, through: :person_starships
end
