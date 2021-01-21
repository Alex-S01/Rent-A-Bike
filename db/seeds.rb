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


10.times do
    bike = Bike.create!(
      # user: User.find(rand(1..10)),
        user: User.find(rand((User.first.id)..(User.last.id))),
        model: Faker::Vehicle.model,
        condition: %w[new very_good good].sample,
        price: Faker::Commerce.price,
        address: Faker::Address.full_address
    )

    puts "Bike #{bike.id} is created"
end

puts "done"
