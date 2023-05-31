# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
puts "Cleaning database..."
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
car1 = { title: "Peugeot 308 flammes gros pots", description: "Des gros pots qui envoient du lourd", price: 20, user: galmier, name: "Jacquemin Tunning", address: "72 rue des Sureaux, Sainghin-en-Mélantois" }
car2 = { title: "Renault Clio 3", description: "Rabaissée au max, attention aux dos d'âne", price: 30, user: mathieu, name: "Tunning qui pète", address: "Place Bellecour, Lyon" }
car3 = { title: "Tesla fluo", description: "Plus électrique que Pikachu", price: 100, user: mathilde, name: "Tunning Vroum", address: "17 place Paul Doumer, Bordeaux" }
car4 = { title: "Honda Civic", description: "Appartenue à Dominique Toreto, sièges baqués, confort au max, gros rouling", price: 50, user: alex, name: "Quartier Nord TUNNING", address: "61 rue Marx Dormoy, Marseille" }

[car1, car2, car3, car4].each do |attributes|
  car = Car.create!(attributes)
  puts "Created #{car.title}"
end
puts "Finished!"

puts "Bookings "
puts "Cleaning Database"


booking1 = { start_date: Faker::Date.backward, end_date: Faker::Date.forward, user: galmier, car:mathieu.cars.first}
booking2 = { start_date: Faker::Date.backward, end_date: Faker::Date.forward, user: mathieu, car:galmier.cars.first}

Booking.create(booking1)
Booking.create(booking2)



puts "booking created"
