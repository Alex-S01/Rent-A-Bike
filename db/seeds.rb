# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "cleaning up database"
User.destroy_all
puts "database is clean"

# generate 20 users
20.times do
    user = User.create!(
        email: Faker::Internet.email,
        password: "123456"
    )

    puts "User #{user.id} is created"
end

addresses = [
  'Kantersteen 12, 1000 Brussel',
  'Tweedekkerstraat 126, 1130 Brussel',
  'Sint-Lambertusstraat 200, 1200 Sint-Lambrechts-Woluwe',
  'Boondaalsesteenweg 418, 1050 Elsene',
  'Rogierlaan 51, 1030 Schaarbeek',
  'Jean Joseph Crocqlaan 15, 1020 Brussel',
  'Rue Marie Depage 1, 1180 Uccle',
  'Wayezstraat 160-162, 1070 Anderlecht',
  'Ter Platen 12, 9000 Gent',
  'Gebroeders de Smetstraat 6, 9000 Gent'
]

10.times do |i|
    bike = Bike.create!(
      # user: User.find(rand(1..10)),
        user: User.find(rand((User.first.id)..(User.last.id))),
        model: Faker::Vehicle.model,
        condition: %w[new very_good good].sample,
        price: Faker::Commerce.price,
        address: addresses[i]
    )

    puts "Bike #{bike.id} is created"
end

puts "done"
