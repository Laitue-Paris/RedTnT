class Clothe < ApplicationRecord
  has_one_attached :photo
  has_many :rentals
  belongs_to :user
  has_many :rentals

  COLORS = ["Blood Red", "Brick Red", "Bright Red", "Brown", "Burgundy", "Burnt Umber", "Burnt Orange", "Burnt Sienna", "Byzantium", "Cadmium Red", "Cardinal Red", "Carmine", "Cerise", "Cherry", "Chestnut", "Claret", "Coral Pink", "Cordovan", "Crimson", "Dark Red", "Falu Red", "Garnet", "Mahogany", "Maroon", "Marsala", "Mulberry", "Neon Red", "Oxblood", "Pastel Red", "Persimmon", "Poppy", "Puce", "Raspberry", "Red", "Red Brown", "Red Ochre", "Red"]
  COLORS_HEX = {
    "Blood Red" => "#660000",
    "Brick Red" => "#CB4154",
    "Bright Red" => "#FF0000",
    "Brown" => "#A52A2A",
    "Burgundy" => "#800020",
    "Burnt Umber" => "#8A3324",
    "Burnt Orange" => "#CC5500",
    "Burnt Sienna" => "#E97451",
    "Byzantium" => "#702963",
    "Cadmium Red" => "#E30022",
    "Cardinal Red" => "#C41E3A",
    "Carmine" => "#960018",
    "Cerise" => "#DE3163",
    "Cherry" => "#D2042D",
    "Chestnut" => "#954535",
    "Claret" => "#7F1734",
    "Coral Pink" => "#F88379",
    "Cordovan" => "#893F45",
    "Crimson" => "#DC143C",
    "Dark Red" => "#8B0000",
    "Falu Red" => "#801818",
    "Garnet" => "#733635",
    "Mahogany" => "#C04000",
    "Maroon" => "#800000",
    "Marsala" => "#964F4C",
    "Mulberry" => "#C54B8C",
    "Neon Red" => "#FF073A",
    "Oxblood" => "#4A0000",
    "Pastel Red" => "#FF6961",
    "Persimmon" => "#EC5800",
    "Poppy" => "#E35335",
    "Puce" => "#CC8899",
    "Raspberry" => "#E30B5C",
    "Red" => "#FF0000",
    "Red Brown" => "#A52A2A",
    "Red Ochre" => "#913831"
  }

  SIZES = ["XS", "S", "M", "L", "XL", "XXL", "XXXL"]
  CATEGORIES = ["T-shirt", "Sweatshirt"]
  BRANDS = ["Uniqlo", "Zara", "H&M", "Nike", "Adidas", "Levi's", "Gucci", "Prada", "Ralph Lauren", "Lacoste"]


  validates :color, inclusion: { in: COLORS }
  validates :brand, inclusion: { in: BRANDS }
  validates :size, inclusion: { in: SIZES }
  validates :category, inclusion: { in: CATEGORIES }
  validates :price, numericality: true

  def hexa_color
    COLORS_HEX[color]
  end

end
