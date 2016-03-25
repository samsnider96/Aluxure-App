class Item < ActiveRecord::Base

  belongs_to :user
  has_many :product_images, dependent: :destroy
  has_many :appointment_items
  has_many :appointment_reqeusts, through: :appointment_items

  validates_presence_of :brand, :category, :color, :condition, :description, :image_upload_id

  GENDERS = ["Mens", "Womens", "Unisex"]

  CONDITION = ["New", "Like New", "Very Good", "Good", "Fair"]

  WOMENS_CATEGORIES = ["Dress", "Skirt", "Shirt", "Blouse", "Sweater", "Outerwear", "Denim", "Active Wear", "Pants", "Shorts", "Suit", "Blazer", "Swimwear", "Shoes", "Bags", "OTHER"]

  WOMENS_BAG_CATEGORIES = ["Handbags", "Shoulder Bags & Hobos", "Totes", "Satchel", "Clutches", "Crossbody", "Backpacks", "Wristlets", "OTHER"]

  WOMENS_SHOE_CATEGORIES = ["Sandals", "Boots", "Booties", "Flats", "Heels & Pumps", "Wedges", "Slippers", "Athletic", "Loafers", "Clogs"]

  WOMENS_SIZES = ["XXS", "XS", "S", "M ", "L", "XL", "XXL", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "0P", "2P", "4P", "6P", "8P", "10P", "12P", "14P", "16P", "28", "30", "32", "34", "36", "38", "40", "42", "44", "OTHER"]

  WOMENS_SHOE_WIDTH = ["Narrow", "Medium", "Wide"]

  WOMENS_SHOE_SIZES = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12"]

  WOMENS_APPAREL_MATERIALS = ["Leather", "Suede", "Silk", "Cotton", "Rayon", "Wool", "Linen", "Rayon", "Nylon", "Polyester", "Acrylic"]

  WOMENS_SHOE_MATERIALS = ["Canvas", "Leather ", "Faux Leather", "Suede", "Hemp", "OTHER"]

  WOMENS_APPAREL_BRANDS = ["ABS by Allen B. Schwartz", "Adrianna Papell", "Alice + Olivia", "Anne Klein", "Badgley Mischka", "BCBG", "BCBGeneration", "BOSS Hugo Boss", "Catherine Catherine ", "Cynthia Rowley", "Diane von Furstenberg", "Elie Tahari", "Ella Moss", "ESCADA", "Free People", "French Connection", "Halston Heritage", "J.McLaughlin", "joan vass", "Julie Brown", "Karen Millen", "Kay Unger", "Lafayette", "New York", "Lafayette", "New York Petites", "New York Plus", "Laundry", "Lilla ", "Lucy Paris", "Mara Hoffman", "Marc New York", "Max Mara", "Melly M", "Mink Pink", "Mott 50", "Nicole Miller", "Olivaceous", "Parker", "Pink Tartan", "Rachel Zoe", "Rebecca Minkoff", "Rebecca Taylor", "Shoshanna", "Single", "Soft Joie", "SOUTHERN fROCK", "Splendid", "Sue Wong", "susana Monaco", "T Tahari", "Tahari by Arthur S. Levine", "TART", "Taylor", "Theory", "Three Dots", "Tocca", "Tommy Bahama", "Tori Richard", "Tory Burch", "TOWNSEN", "Trina Turk", "YAL NY ", "Young Fabulous & Broke", "YUMMI", "OTHER"]

  WOMENS_HANDBAG_BRANDS = ["Bottega Veneta", "Burberry", "Celine", "Chanel", "Chloe", "Coach", "Cole Haan", "FENDI", "Furla", "Givenchy", "Gucci", "Hermes", "Jimmy Choo", "Judith Leiber Couture", "kate spade new York", "LANVIN", "Longchamp", "Louis Vuitton", "Miu Miu", "Prada", "Saint Laurent", "Salvatore Ferragamo", "Stella McCartney", "Tod's", "Valentino", "Yves Saint Laurent", "OTHER "]

  WOMENS_SHOE_BRANDS = ["andrew stevens", "Arche", "Ash", "BCBGeneration", "Belle", "Bettye Muller", "Carolinna Espinosa", "Charles by Charles David", "Charles David", "Clarks", "Cole Haan", "Dolce Vita", "Donald J Pliner", "Elie Tahari", "Franco Sarto", "French Connection", "Giuseppe Zanotti", "Halston Heritage", "Isola", "Ivanka Trump", "Jack Rogers", "Jimmy Choo", "JOE'S Jeans", "Joie", "Kay Unger", "L.K.Bennett", "Latigo", "Lucky Brand", "Marc Fisher", "New Balance", "Nisolo", "Dr.  Scholl's Collection", "Prada", "PUMA", "Rachel Zoe", "Rebecca Minkoff", "Rockport", "Saint Laurent", "Salvatore Ferragamo", "SeaVees", "Sesto Meucci", "Seychelles", "Sperry", "Steven By Steve Madden", "Tahari", "Tod's", "Tommy Bahama", "Tretorn", "Trina Turk", "UGG", "Valentino", "Vaneli", "Via Spiga", "Vince", "Vince Camuto", "Yves Saint Laurent", "OTHER"]

  MENS_CATEGORIES = ["Shirts", "Outerwear", "Suits", "Sport Coats", "Sweaters & Hoodies", "Denim", "Active Wear", "Pants", "Polos & Tees", "Shorts", "Swimwear", "OTHER"]

  MENS_SHIRT_SIZES = ["S", "M", "L", "XL", "XXL", "XXL", "15", "15.5", "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "OTHER "]

  MENS_SLEEVE_LENGTH = ["32", "32/33", "33", "33/34", "34", "34/35", "35", "35/36", "36", "36/37", "37", "37/38", "38", "OTHER"]

  MENS_PANTS_SIZES = ["26", "28", "30", "32", "34", "36", "38", "40", "42", "44", "46", "XXS", "XS", "S", "M", "L", "XL", "XXL", "OTHER"]

  MENS_INSEAM_LENGTH = ["Short", "Regular", "Long"]

  MENS_JACKET_SIZES = ["38", "40", "42", "44", "46", "48", "50", "52", "54", "56"]

  MENS_SUIT_LENGTH = ["Short", "Regular", "Long", "X-Long"]

  MENS_APPAREL_BRANDS = ["Ben Sherman", "Borgo", "Brooks Brothers", "English Laundry", "Forsyth of Canada", "HIHO", "HUDSON", "Hugo Boss", "Ike Behar", "J.McLaughlin", "JOE'S", "John Varvatos", "JOHNNIE-O7", "Maker & Company", "Report Collection", "Robert Graham", "Seven For All Mankind", "Southern Tide", "Splendid Mills", "Theory", "Vince Camuto", "vineyard vines", "WRK17", "OTHER"]

  MENS_APPAREL_MATERIALS = ["Leather", "Suede", "Silk", "Cotton", "Denim", "Wool", "Linen", "OTHER"]

  MENS_SHOE_CATEGORIES = ["Formal Shoes", "Boots", "Athletic", "Oxfords", "Loafers", "Sneakers", "Slippers", "Flats"]

  MENS_SHOE_BRANDS = ["Andrew Marc", "ASICS", "Baffin", "Base London", "Ben Sherman", "Bruno Magli", "Clarks", "Cole Haan", "Donald J Pliner", "Dr. Martens", "Dune London", "French Connection", "Hugo Boss", "Hunter", "JOE'S Jeans", "John Varvatos", "Kenneth Cole", "New Balance", "On Running", "Dr. Scholl’s Collection", "Original Penguin", "Pajar", "PUMA", "Reebok", "Robert Graham", "Rockport", "Salvatore Ferragamo", "Saucony", "Sperry", "The Kooples", "Timberland", "Tod's", "Tommy Bahama", "Vince", "Woolrich", "OTHER "]

  MENS_SHOE_MATERIALS = ["Canvas", "Leather ", "Faux Leather", "Suede", "OTHER"]

  MENS_SHOE_SIZES = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "OTHER"]

  MENS_SHOE_WIDTH = ["Narrow", "Medium/Standard", "Wide"]

  COLORS = ["Brown", "Black", "Red", "Pink", "Blue", "White", "Green", "Beige", "Orange", "Yellow", "Purple", "Grey", "Multicolor", "Metallic", "OTHER "]

end
