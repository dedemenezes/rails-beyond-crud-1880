# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning the DB'

Restaurant.destroy_all

puts 'Creating restaurants...'

temakeria = Restaurant.new(name: 'Temakeria', address: 'Ipanema - Rio de janeiro', rating: 5, chef_name: 'Bia')
temakeria.save

outback = Restaurant.new(name: 'Outback', address: 'Botafogo - Rio de Janeiro', rating: 4, chef_name: 'Nominoe')
outback.save

puts "Restaurants created! zo/"
