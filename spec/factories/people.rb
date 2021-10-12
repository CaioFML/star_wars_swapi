FactoryBot.define do
  factory :person do
    sequence(:name) { |n| "person#{n}" }

    association :homeworld, factory: :planet

    sequence :url do |n|
      "https://someurl.com/#{n}"
    end
  end
end
