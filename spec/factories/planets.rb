FactoryBot.define do
  factory :planet do
    name { Faker::Name.unique.name }

    sequence :url do |n|
      "https://someurl.com/#{n}"
    end
  end
end
