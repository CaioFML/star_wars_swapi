FactoryBot.define do
  factory :starship do
    sequence(:name) { |n| "name#{n}" }

    sequence :url do |n|
      "https://someurl.com/#{n}"
    end
  end
end
