# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.destroy_all
# generate 20 users
20.times do
    User.create!(
        email: Faker::Internet.email,
        password: "123456"
    )

end


10.times do
    Bike.create!(
        user: User.find(rand(1..10)),
        model: Faker::University.name,
        condition: %w[new very good good].sample,
        price: Faker::Commerce.price
    )
end
