FactoryBot.define do
  factory :event do
    name                               { Faker::Name.name }
    event_date                         { DateTime.now }
    fee                                { Faker::Number.number(digits: 4) }
  end
end
 