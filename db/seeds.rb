# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do |i|
  Event.create(
                name: Faker::Name.name,
                event_date:Faker::Time.between(from: DateTime.now + i, to: DateTime.now)
              )
end

1000.times do |i|
  User.create(
               name: Faker::Name.name,
               email: Faker::Internet.email,
               gender: 1,
               password: 123456
             )
end
