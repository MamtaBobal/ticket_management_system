FactoryBot.define do
  factory :event do
    name                               { Faker::Book.title }
    event_date                         { DateTime.now }
    fee                                { [1000, 1200, 1500, 1700, 2000].sample }
  end
end
 