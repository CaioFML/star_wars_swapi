FactoryBot.define do
  factory :planet do
    name { Faker::Movies::StarWars.planet }
    sequence :url do |n|
      "https://someurl.com/#{n}"
    end
  end
end
