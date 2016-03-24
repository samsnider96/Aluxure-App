# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Gender.create(id: 1, name: "Men") if Gender.where(name: "Men").empty?
Gender.create(id: 2, name: "Women") if Gender.where(name: "Women").empty?
Gender.create(id: 3, name: "Unisex") if Gender.where(name: "Unisex").empty?


womens_categories = ["Dress", "Skirt", "Shirt", "Blouse", "Sweater", "Outerwear", "Denim", "Active Wear", "Pants", "Shorts", "Suit", "Blazer", "Swimwear", "Shoes", "Bags", "OTHER"]

womens_bag_categories = ["Handbags", "Shoulder Bags & Hobos", "Totes", "Satchel", "Clutches", "Crossbody", "Backpacks", "Wristlets", "OTHER"]

womens_sizes = ["XXS", "XS", "S", "M ", "L", "XL", "XXL", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "0P", "2P", "4P", "6P", "8P", "10P", "12P", "14P", "16P", "28", "30", "32", "34", "36", "38", "40", "42", "44", "OTHER"]

women_shoe_size = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12"]

womens_apparel_materials = ["Leather", "Suede", "Silk", "Cotton", "Rayon", "Wool", "Linen", "Rayon", "Nylon", "Polyester", "Acrylic"]

womens_shoe_materials = ["Canvas", "Leather ", "Faux Leather", "Suede", "Hemp", "OTHER"]

womens_apparel_brands = ["ABS by Allen B. Schwartz", "Adrianna Papell", "Alice + Olivia", "Anne Klein", "Badgley Mischka", "BCBG", "BCBGeneration", "BOSS Hugo Boss", "Catherine Catherine ", "Cynthia Rowley", "Diane von Furstenberg", "Elie Tahari", "Ella Moss", "ESCADA", "Free People", "French Connection", "Halston Heritage", "J.McLaughlin", "joan vass", "Julie Brown", "Karen Millen", "Kay Unger", "Lafayette", "New York", "Lafayette", "New York Petites", "New York Plus", "Laundry", "Lilla ", "Lucy Paris", "Mara Hoffman", "Marc New York", "Max Mara", "Melly M", "Mink Pink", "Mott 50", "Nicole Miller", "Olivaceous", "Parker", "Pink Tartan", "Rachel Zoe", "Rebecca Minkoff", "Rebecca Taylor", "Shoshanna", "Single", "Soft Joie", "SOUTHERN fROCK", "Splendid", "Sue Wong", "susana Monaco", "T Tahari", "Tahari by Arthur S. Levine", "TART", "Taylor", "Theory", "Three Dots", "Tocca", "Tommy Bahama", "Tori Richard", "Tory Burch", "TOWNSEN", "Trina Turk", "YAL NY ", "Young Fabulous & Broke", "YUMMI", "OTHER"]

womens_handbag_brands = ["Bottega Veneta", "Burberry", "Celine", "Chanel", "Chloe", "Coach", "Cole Haan", "FENDI", "Furla", "Givenchy", "Gucci", "Hermes", "Jimmy Choo", "Judith Leiber Couture", "kate spade new York", "LANVIN", "Longchamp", "Louis Vuitton", "Miu Miu", "Prada", "Saint Laurent", "Salvatore Ferragamo", "Stella McCartney", "Tod's", "Valentino", "Yves Saint Laurent", "OTHER "]

womens_shoe_brands = ["andrew stevens", "Arche", "Ash", "BCBGeneration", "Belle", "Bettye Muller", "Carolinna Espinosa", "Charles by Charles David", "Charles David", "Clarks", "Cole Haan", "Dolce Vita", "Donald J Pliner", "Elie Tahari", "Franco Sarto", "French Connection", "Giuseppe Zanotti", "Halston Heritage", "Isola", "Ivanka Trump", "Jack Rogers", "Jimmy Choo", "JOE'S Jeans", "Joie", "Kay Unger", "L.K.Bennett", "Latigo", "Lucky Brand", "Marc Fisher", "New Balance", "Nisolo", "Dr.  Scholl's Collection", "Prada", "PUMA", "Rachel Zoe", "Rebecca Minkoff", "Rockport", "Saint Laurent", "Salvatore Ferragamo", "SeaVees", "Sesto Meucci", "Seychelles", "Sperry", "Steven By Steve Madden", "Tahari", "Tod's", "Tommy Bahama", "Tretorn", "Trina Turk", "UGG", "Valentino", "Vaneli", "Via Spiga", "Vince", "Vince Camuto", "Yves Saint Laurent", "OTHER"]





womens_categories.each {|category| Category.create(type: "category", name: category, gender: 2, category: "Clothes")}




