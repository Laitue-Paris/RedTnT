# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

RED_TSHIRT_NAMES = [
  "Crimson Blaze T-shirt",
  "Ruby Glow Tee",
  "Scarlet Wave Shirt",
  "Firebrick Red Tee",
  "Cherry Sunset Shirt",
  "Cardinal Charm Tee",
  "Sangria Essence T-shirt",
  "Rosewood Classic Tee",
  "Brick Flame Shirt",
  "Garnet Luxe Tee"
]

RED_TSHIRT_DESCRIPTIONS = [
  "Bold and vibrant, perfect for making a statement.",
  "A sleek red T-shirt that adds a pop of color to your wardrobe.",
  "Soft and comfortable, ideal for any casual outing.",
  "A classic red shade with a modern fit for everyday wear.",
  "Designed for comfort and style in a radiant red hue.",
  "Turn heads with this deep red tee, a must-have staple.",
  "Feel the energy of crimson in this stylish and durable shirt.",
  "The perfect mix of elegance and casual flair in bright red.",
  "Vividly colored and crafted for all-day comfort.",
  "Brighten up your day with this chic and cozy red T-shirt."
]

FIRST_NAMES = %w[Jean Marie Paul Sophie Claire Jacques Elise Lucie Antoine Camille]
LAST_NAMES = %w[Durand Dupont Martin Bernard Morel Lefebvre Simon Laurent Michel David]
EMAIL_DOMAINS = %w[gmail.com yahoo.com outlook.com example.com]

puts "Cleaning the database..."
Clothe.destroy_all
User.destroy_all

puts "Creating some users "

5.times do
  first_name = FIRST_NAMES.sample
  last_name = LAST_NAMES.sample
  email = "#{first_name.downcase}.#{last_name.downcase}@#{EMAIL_DOMAINS.sample}"

  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: "123456"
  )
end
  user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "123456")

puts "Finished creating #{User.count} Clothes "

puts "Creating some Clothes for a rental website of Red T-shirt"

# Generate 50 red T-shirts with unique names and descriptions
50.times do
  clothe = Clothe.create!(
    name: RED_TSHIRT_NAMES.sample,
    color: "Red",
    price: [19, 29, 39, 49, 59].sample,
    size: Clothe::SIZES.sample,
    category: Clothe::CATEGORIES.sample,
    brand: Clothe::BRANDS.sample,
    description: RED_TSHIRT_DESCRIPTIONS.sample,
    user: User.all.sample
  )
end

puts "50 red T-shirts with unique names and descriptions created!"

user_photos = ["user-1.png", "user-2.png", "user-3.png"]

user_photos.each do |photo|
  file_path = File.open("app/assets/images/#{photo}")
  user.photo.attach(io: file_path, filename: "#{photo}", content_type: "image/png")
  user.save
end

tshirts_photos = ["tshirt-.jpg", "tshirt-2.jpg", "tshirt-3.jpg", "tshirt-4.jpg","tshirt-5.jpg","tshirt-6.jpg","tshirt-7.jpg","tshirt-8.jpg","tshirt-9.jpg","tshirt-10.jpg"]

tshirts_photos.each do |photo|
  file_path = File.open("app/assets/images/#{photo}")
  clothe.photo.attach(io: file_path, filename: "#{photo}", content_type: "image/jpg")
  clothe.save
end

# Clothe.create!(
#   name: "Red T-shirt",
#   color: Clothe::COLORS.sample,
#   price: [19, 29, 39, 49, 59].sample,
#   size: Clothe::SIZES.sample,
#   category: Clothe::CATEGORIES.sample,
#   brand: Clothe::BRANDS.sample,
#   description: "This is a red T-shirt",
#   user: user1
# )


# Clothe.create!(
#   name: "Red T-rt",
#   color: Clothe::COLORS.sample,
#   price: [19, 29, 39, 49, 59].sample,
#   size: Clothe::SIZES.sample,
#   category: Clothe::CATEGORIES.sample,
#   brand: Clothe::BRANDS.sample,
#   description: "This is a red T-shirt",
#   user: user1
# )

# Clothe.create!(
#   name: "Red T",
#   color: Clothe::COLORS.sample,
#   price: [19, 29, 39, 49, 59].sample,
#   size: Clothe::SIZES.sample,
#   category: Clothe::CATEGORIES.sample,
#   brand: Clothe::BRANDS.sample,
#   description: "This is a red T-shirt",
#   user: user1
# )

# Clothe.create!(
#   name: "Red",
#   color: Clothe::COLORS.sample,
#   price: [19, 29, 39, 49, 59].sample,
#   size: Clothe::SIZES.sample,
#   category: Clothe::CATEGORIES.sample,
#   brand: Clothe::BRANDS.sample,
#   description: "This is a red T-shirt",
#   user: user1
# )

# Clothe.create!(
#   name: "Re(a)d",
#   color: Clothe::COLORS.sample,
#   price: [19, 29, 39, 49, 59].sample,
#   size: Clothe::SIZES.sample,
#   category: Clothe::CATEGORIES.sample,
#   brand: Clothe::BRANDS.sample,
#   description: "This is a red T-shirt",
#   user: user1
# )

# Clothe.create!(
#   name: "Red Tomato",
#   color: Clothe::COLORS.sample,
#   price: [19, 29, 39, 49, 59].sample,
#   size: Clothe::SIZES.sample,
#   category: Clothe::CATEGORIES.sample,
#   brand: Clothe::BRANDS.sample,
#   description: "This is a red T-shirt",
#   user: user1
# )

# Clothe.create!(
#   name: "Red Strawberry T",
#   color: Clothe::COLORS.sample,
#   price: [19, 29, 39, 49, 59].sample,
#   size: Clothe::SIZES.sample,
#   category: Clothe::CATEGORIES.sample,
#   brand: Clothe::BRANDS.sample,
#   description: "This is a red T-shirt",
#   user: user1
# )


puts "Finished creating #{Clothe.count} Clothes "
