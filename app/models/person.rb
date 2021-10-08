class Person < ApplicationRecord
  belongs_to :homeworld, foreign_key: :planet_id, class_name: "Planet"
end
