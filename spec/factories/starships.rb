FactoryBot.define do
  factory :starship do
    name { Faker::Movies::StarWars.vehicle }
    sequence :url do |n|
      "https://someurl.com/#{n}"
    end
  end
end
