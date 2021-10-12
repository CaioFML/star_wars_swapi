FactoryBot.define do
  factory :starship do
    name { Faker::Name.unique.name }

    sequence :url do |n|
      "https://someurl.com/#{n}"
    end
  end
end
