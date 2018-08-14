# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "captain@caveman.com", password: "123456")
User.create(email: "conan@thebarbarian.com", password: "123456")
User.create(email: "gollum@thepreciouss.net", password: "123456")
User.create(email: "barney@rubble.com", password: "123456")
User.create(email: "fred@flintstone.com", password: "123456")

Cave.create(name: "Gollum's Preciouss Pad", user: User.all[2], description: "It's so precious!", price: "4")
Cave.create(name: "Captain's Unga Bungalow", user: User.find(1), description: "Unga bunga!", price: "6")
Cave.create(name: "Cimmerian Spice", user: User.find(2), description: "What is best in life? To crush your enemies, to see them driven before you, and to hear the lamentations of whoever you beat to this cave.", price: "5")

Booking.create(cave: Cave.find(1), user: User.find(1), checkin: "10-10-2018", checkout: "10-12-2018")
Booking.create(cave: Cave.find(2), user: User.find(2), checkin: "10-11-2018", checkout: "11-12-2018")
