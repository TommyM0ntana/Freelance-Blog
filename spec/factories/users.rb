require 'faker'

FactoryBot.define do
  factory :user, alias: %i[friend] do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
