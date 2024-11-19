# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Cleaning the database..."
Clothe.destroy_all

puts "Creating 4 Clothes for a rental website of Red T-shirt"

Clothe.create(
  name: "Red T-shirt",
  color: "Red",
  price: [19, 29, 39, 49, 59].sample,
  size: ["S", "M", "L", "XL"].sample,
  category: ["T-shirt", "Sweatshirt"].sample,
  description: "This is a red T-shirt",
)

Clothe.create(
  name: "RedT",
  color: "Red Tomato",
  price: [19, 29, 39, 49, 59].sample,
  size: ["S", "M", "L", "XL"].sample,
  category: ["T-shirt", "Sweatshirt"].sample,
  description: "This is a red T-shirt",
)

Clothe.create(
  name: "Re(a)d",
  color: "Strawberry Red",
  price: [19, 29, 39, 49, 59].sample,
  size: ["S", "M", "L", "XL"].sample,
  category: ["T-shirt", "Sweatshirt"].sample,
  description: "This is a red T-shirt",
)

Clothe.create(
  name: "Red T",
  color: "Red",
  price: [19, 29, 39, 49, 59].sample,
  size: ["S", "M", "L", "XL"].sample,
  category: ["T-shirt", "Sweatshirt"].sample,
  description: "This is a red T-shirt",
)

puts "Finished creating #{Clothe.count} Clothes "
