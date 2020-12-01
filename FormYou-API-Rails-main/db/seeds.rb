# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.destroy_all
Formation.destroy_all
Category.destroy_all
Room.destroy_all
Session.destroy_all

1.times do 
  User.create(
    email: "student@yopmail.com",
    password: "123456",
    firstname: "student",
    lastname: "yoni",
    status: "student",
    validated: true
  )
  puts "Student created"
end


1.times do 
  User.create(
    email: "teacher@yopmail.com",
    password: "123456",
    firstname: "teacher",
    lastname: "olivier",
    status: "teacher",
    validated: true
  )
  puts "Teacher created"
end

1.times do 
  User.create(
    email: "admin@yopmail.com",
    password: "123456",
    firstname: "admin",
    lastname: "vivien",
    status: "admin",
    validated: true
  )
  puts "Admin created"
end


10.times do 
  Formation.create(
    title: Faker::JapaneseMedia::OnePiece.character,
    description: Faker::JapaneseMedia::OnePiece.quote,
    user_id: User.find_by(status: "teacher").id
  )
  puts "1 Formation created"
end


15.times do
  Category.create(
    name: Faker::ProgrammingLanguage.name
  )
end
puts "Categories created"


n=0
10.times do 
  n+=1
  Room.create(
    number: n 
  )
end

20.times do 
  Session.create(
    capacity: 20,
    date: Date.today + rand(1...20),
    formation_id: rand(Formation.first.id...Formation.last.id),
    room_id: rand(Room.first.id...Room.last.id)
  )
end 