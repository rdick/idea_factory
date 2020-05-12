# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.delete_all
Idea.delete_all
User.delete_all

PASSWORD ='1'

REVEIWS_NUM = 2
IDEAS_NUM = 20
NUM_USERS = 10

User.create(
    name: 'ryan',
    email: 'rdick@ualberta.ca',
    password: PASSWORD
)

NUM_USERS.times do
    User.create(
        name: Faker::Name.first_name,
        email: Faker::Internet.email,
        password: PASSWORD
    )
end

users = User.all

IDEAS_NUM.times do
    i = Idea.create({
        title: Faker::Games::HalfLife.enemy,
        body: Faker::Lorem.paragraph,
        user: users.sample
    })
    
    if i.valid?
        REVEIWS_NUM.times do
            Review.create(
                body: Faker::Superhero.name,
                idea: i,
                user: users.sample
            )
        end
    end
end

puts "generated #{Review.all.count} reviews"
puts "generated #{Idea.all.count} ideas"
puts "generated #{User.all.count} users"
    