# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

1000.times do |i|
  Event.create(
                name: Faker::Book.title,
                event_date:Faker::Time.between(from: DateTime.now + i, to: DateTime.now),
                fee: [1000, 1200, 1500, 1700, 2000].sample
              )
end

5000.times do |i|
  User.create(
               name: Faker::Name.name,
               email: Faker::Internet.email,
               gender: %i[male female].sample,
               password: 123456
             )
end

2000.times do |i|
  begin UserEvent.create( user_id: rand(1..5000), event_id: rand(1..1000) )
  rescue => error
    next
  end
end
