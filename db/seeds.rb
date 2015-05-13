# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "12345678",
             password_confirmation: "12345678")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
	title = Faker::Lorem.word
	description = Faker::Lorem.sentence(3)
	ingredients = Faker::Lorem.sentence(3)
	servings = 4
	directions = Faker::Lorem.sentence(5)
	cooktime = 30
	users.each { |user| user.recipes.create!(title: title, description: description, 
		ingredients: ingredients, servings: servings, directions: directions, cooktime: cooktime)}

end

   


