# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# generate 20 users
(1..20).each do |id|
    User.create!(
        id: id,
        name: Faker::Name.name,
        email: Faker::Internet.email
        role: %w[customer owner].sample
    )
end


(1..10).each do |id|
    Bike.create!(
        id: id,
        user_id: rand(1..20),
        Model: Faker::University.name,
        status: %w[new very good good].sample,
# generate a fake paragraph
        Price: Faker::Commerce.price
    )
end
