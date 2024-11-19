class Clothe < ApplicationRecord
  belongs_to :user
  
  COLORS = ["Blood Red", "Brick Red", "Bright Red", "Brown", "Burgundy", "Burnt Umber", "Burnt Orange", "Burnt Sienna", "Byzantium", "Cadmium Red", "Cardinal Red", "Carmine", "Cerise", "Cherry", "Chestnut", "Claret", "Coral Pink", "Cordovan", "Crimson", "Dark Red", "Falu Red", "Garnet", "Mahogany", "Maroon", "Marsala", "Mulberry", "Neon Red", "Oxblood", "Pastel Red", "Persimmon", "Poppy", "Puce", "Raspberry", "Red", "Red Brown", "Red Ochre", "Red"]
  SIZES = ["XS", "S", "M", "L", "XL", "XXL", "XXXL"]
  CATEGORIES = ["T-shirt", "Sweatshirt"]

  validates :color, inclusion: { in: COLORS }
  validates :size, inclusion: { in: SIZES }
  validates :category, inclusion: { in: CATEGORIES }
  validates :price, numericality: true
end
