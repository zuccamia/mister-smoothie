# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

puts "Cleaning database..."
Smoothie.destroy_all
Ingredient.destroy_all

puts "Getting ingredient list..."
api_end_point = "http://tropicalfruitandveg.com/api/tfvjsonapi.php?search=all"
json = URI.open(api_end_point).read
data = JSON.parse(json)

INGREDIENTS = data["results"].map { |item| { name: item["tfvname"], img_url: item["imageurl"] } }

puts "List now filled!"
puts "Seeding ingredients..."

INGREDIENTS.each do |ingredient|
  new_ingredient = Ingredient.create(name: ingredient[:name], img_url: ingredient[:img_url])

  puts "Created #{new_ingredient.name} with id #{new_ingredient.id}"

end

puts "Done!"
