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
  "T-shirt Éclat Framboise",
  "T-shirt Lumière Rubis",
  "T-shirt Vague Écarlate",
  "T-shirt Rouge Brique",
  "T-shirt Coucher de Soleil Cerise",
  "T-shirt Charme Cardinal",
  "T-shirt Essence Sangria",
  "T-shirt Classique Bois de Rose",
  "T-shirt Flamme de Brique",
  "T-shirt Luxe Grenat"
]

RED_TSHIRT_DESCRIPTIONS = [
  "Un T-shirt rouge éclatant qui attire tous les regards. Parfait pour ceux qui aiment se démarquer et affirmer leur style avec audace et confiance.",
  "Avec son rouge profond et sa coupe moderne, ce T-shirt apporte une touche d'élégance tout en restant décontracté. Un indispensable pour illuminer vos tenues quotidiennes.",
  "Conçu pour allier confort et esthétique, ce T-shirt rouge vif est idéal pour une journée relaxante ou une soirée décontractée entre amis.",
  "Affichez un style intemporel avec ce T-shirt rouge classique. Sa teinte vibrante et son design épuré en font un choix polyvalent et élégant.",
  "Inspiré des couleurs d'un coucher de soleil, ce T-shirt rouge cerise incarne la chaleur et la sérénité. Un vêtement aussi confortable que captivant.",
  "Ce T-shirt rouge cardinal est conçu pour les amoureux de la mode. Son rouge riche et profond en fait un incontournable pour un look raffiné et tendance.",
  "Plongez dans l'intensité du rouge sangria avec ce T-shirt sophistiqué. Parfait pour ceux qui recherchent une pièce unique qui respire la confiance et le style.",
  "Avec sa teinte bois de rose et sa finition classique, ce T-shirt s'adapte aussi bien aux moments décontractés qu'aux occasions spéciales.",
  "Ajoutez une touche de feu à votre garde-robe avec ce T-shirt flamme brique. Idéal pour apporter du dynamisme à vos looks tout en restant ultra confortable.",
  "Laissez-vous séduire par le luxe discret de ce T-shirt grenat. Une pièce intemporelle qui marie parfaitement confort, qualité et élégance."
]


FIRST_NAMES = %w[Jean Marie Paul Sophie Claire Jacques Elise Lucie Antoine Camille]
LAST_NAMES = %w[Durand Dupont Martin Bernard Morel Lefebvre Simon Laurent Michel David]
EMAIL_DOMAINS = %w[gmail.com yahoo.com outlook.com example.com]

USER_PHOTOS = ["user-1.png", "user-2.png", "user-3.png"]
TSHIRTS_PHOTOS = ["tshirt-1.png", "tshirt-2.png", "tshirt-3.png", "tshirt-4.png","tshirt-5.png","tshirt-6.png","tshirt-7.png","tshirt-8.png","tshirt-9.png","tshirt-10.png"]


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
  photo = USER_PHOTOS.sample
  file_path = File.open("app/assets/images/#{photo}")
  user.photo.attach(io: file_path, filename: "#{photo}", content_type: "image/png")
  user.save
end

user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "123456")
USER_PHOTOS.each do |photo|
  file_path = File.open("app/assets/images/#{photo}")
  user.photo.attach(io: file_path, filename: "#{photo}", content_type: "image/png")
  user.save
end

puts "Finished creating #{User.count} Users"

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
  photo = TSHIRTS_PHOTOS.sample
  file_path = File.open("app/assets/images/#{photo}")
  clothe.photo.attach(io: file_path, filename: "#{photo}", content_type: "image/png")
  clothe.save

end

puts "50 red T-shirts with unique names and descriptions created!"




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
