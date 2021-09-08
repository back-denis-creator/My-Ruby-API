# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

records = 5

records.times do
    User.create({
        name: Faker::Name.name, 
        email: Faker::Internet.email
    })
end

records.times do
    Program.create({
        title: Faker::Game.title, 
        description: Faker::Game.genre
    })
end

i = 0
while i <= records
    i += 1
    Appointment.create({
        user_id: i, 
        program_id: i,
        appointment_date: Time.now
    })
end

