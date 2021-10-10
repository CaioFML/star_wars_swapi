FactoryBot.define do
  factory :specie do
    name { Faker::Movies::StarWars.specie }
    sequence :url do |n|
      "https://someurl.com/#{n}"
    end
  end
end
