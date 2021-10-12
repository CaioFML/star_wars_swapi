FactoryBot.define do
  factory :person do
    name { Faker::Name.unique.name }

    association :homeworld, factory: :planet

    sequence :url do |n|
      "https://someurl.com/#{n}"
    end
  end
end
