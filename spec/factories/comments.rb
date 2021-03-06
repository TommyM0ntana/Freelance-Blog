require 'faker'

FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    association :user
    association :post

    trait :invalid do
      content { '' }
    end
  end
end
