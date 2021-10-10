class Planet < ApplicationRecord
  has_many :residents, class_name: "Person", inverse_of: :homeworld, dependent: :nullify

  validates :name, uniqueness: true
end
