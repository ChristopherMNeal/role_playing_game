# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

1.times do |index|
  user = User.create!({email: 'admin@fake.com', password: 'testing', admin: true})
  rand(3..8).times do |index|
    Character.create!({name: Faker::Superhero.name, role: Faker::Superhero.prefix, health: rand(11..21), user_id: user.id})
  end
end
1.times do |index|
  user = User.create!({email: 'user@fake.com', password: 'testing', admin: false})
  rand(3..8).times do |index|
    Character.create!({name: Faker::Superhero.name, role: Faker::Superhero.prefix, health: rand(11..21), user_id: user.id})
  end
end

p "Created #{User.count} users"
p "Created #{Character.count} characters"