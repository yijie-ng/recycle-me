# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
require 'faker'

User.create!(
  name: 'test',
  email: 'test@test.com',
  phone_number: '123456789',
  password: 'ltes12'
)

2.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    password: Faker::Internet.password
  )
end
puts "User created"

Item.create!(
  title: Faker::Lorem.sentence(word_count: 3),
  description: Faker::Lorem.sentence(word_count: 8),
  condition: Faker::Lorem.sentence(word_count: 1),
  year_made: rand(2000...2021),
  number_available: rand(1..5),
  user_id: 1
)

Item.create!(
  title: Faker::Lorem.sentence(word_count: 3),
  description: Faker::Lorem.sentence(word_count: 8),
  condition: Faker::Lorem.sentence(word_count: 1),
  year_made: rand(2000...2021),
  number_available: rand(1..5),
  user_id: 2
)
puts "Item created"

Exchange.create!(
  location: Faker::Lorem.sentence(word_count: 3),
  method: Faker::Lorem.sentence(word_count: 1),
  time_slot: 900,
  user_id: 1,
  item_id: 1,
)

Exchange.create!(
  location: Faker::Lorem.sentence(word_count: 3),
  method: Faker::Lorem.sentence(word_count: 1),
  time_slot: 1200,
  user_id: 2,
  item_id: 2,
)
puts "Exchange created"
