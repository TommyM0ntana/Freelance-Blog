FactoryBot.define do
  factory :friendship do
    association :user
    association :friend

    trait :not_confirmed do
      status { nil }
    end

    trait :confirmed do
      status { true }
    end
  end
end
