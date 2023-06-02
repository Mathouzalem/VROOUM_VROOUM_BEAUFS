# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require "faker"
puts "Cleaning database..."
Review.destroy_all
Booking.destroy_all
User.destroy_all
puts "Creating users..."
mathilde = User.create!(first_name: "Mathilde", last_name: "bonhomme", email: "mathilde@mail.com", password: "123456")
mathieu = User.create!(first_name: "Mathieu", last_name: "cozian", email: "mathieu@mail.com", password: "123456")
galmier = User.create!(first_name: "Galmier", last_name: "forissier", email: "galmier@mail.com", password: "123456")
alex = User.create!(first_name: "Alex", last_name: "zoonekynd", email: "alex@mail.com", password: "123456")
puts "Finished!"

puts "Cleaning database..."
Car.destroy_all
puts "Creating cars..."

file = URI.open("https://res.cloudinary.com/dfplf60xz/image/upload/v1685698663/photo1_acg9gx.png")
car1 = Car.new(title: "BMW M3", description: "Des gros pots qui envoient du lourd", price: 20, motor: 3.6, fuel: "Essence", brand: "BMW", modele: "M3", year: 2010, power: 400, user: galmier, name: "Jacquemin Tunning", address: "72 rue des Sureaux, Sainghin-en-Mélantois")
car1.photo.attach(io: file, filename: "photo1.png", content_type: "image/png")
car1.save!

file = URI.open("https://res.cloudinary.com/dfplf60xz/image/upload/v1685700502/3b19abd6b51995b7d59f437c576bcb49-removebg-preview_zxx1fv.png")
car2 = Car.new(title: "Volkswagen Scirocco", description: "Rabaissée au max, attention aux dos d'âne", price: 30, motor: 1.6, fuel: "Essence", brand: "Volkswagen", modele: "Scirocco", year: 2007, power: 360,user: mathieu, name: "Tunning qui pète", address: "Place Bellecour, Lyon" )
car2.photo.attach(io: file, filename: "photo2.png", content_type: "image/png")
car2.save!

file = URI.open("https://res.cloudinary.com/dfplf60xz/image/upload/v1685700507/1524bc965f3a680f09b661306ccfc3f8-removebg-preview_cst2mn.png")
car3 = Car.new(title: "Range Rover Evoque", description: "Ecrase tout sur ton passage", price: 100, user: mathilde, motor: 10.4 , fuel: "Essence", brand: "Range Rover", modele: "Evoque", year: 2020, power: 870, name: "Tunning Vroum", address: "17 place Paul Doumer, Bordeaux")
car3.photo.attach(io: file, filename: "photo3.png", content_type: "image/png")
car3.save!

file = URI.open("https://res.cloudinary.com/dfplf60xz/image/upload/v1685700509/b3c311643598e4d7e4f03e66e8c9928e-removebg-preview_hxqwcd.png")
car4 =Car.new(title: "Hyundai RM20", description: "Appartenue à Dominique Toreto, sièges baqués, confort au max, gros rouling", price: 50, user: alex, motor: 2.4, fuel: "Essence", brand: "Hyundai", modele: "RM20", year: 2017, power: 430, name: "Quartier Nord TUNNING", address: "61 rue Marx Dormoy, Marseille" )
car4.photo.attach(io: file, filename: "photo4.png", content_type: "image/png")
car4.save!

# [car1, car2, car3, car4].each do |attributes|
#   car = Car.create!(attributes)
#   puts "Created #{car.title}"
# end



puts "Finished!"

puts "Bookings "
puts "Cleaning Database"


booking1 = { start_date: Faker::Date.backward, end_date: Faker::Date.forward, user: galmier, car: mathieu.cars.first }
booking2 = { start_date: Faker::Date.backward, end_date: Faker::Date.forward, user: mathieu, car: galmier.cars.first }
booking3 = { start_date: Faker::Date.backward, end_date: Faker::Date.forward, user: mathieu, car: alex.cars.first }
booking4 = { start_date: Faker::Date.backward, end_date: Faker::Date.forward, user: mathieu, car: mathilde.cars.first }

Booking.create(booking1)
Booking.create(booking2)
Booking.create(booking3)
Booking.create(booking4)

puts "booking created"
