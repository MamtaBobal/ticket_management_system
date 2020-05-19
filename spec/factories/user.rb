FactoryBot.define do
  factory :user do
    name                               { Faker::Name.name }
    email                              { Faker::Internet.email }
    gender                             { %i[male female].sample }
    password                           { 123456 }
  end
end
