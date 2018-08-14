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

puts "Cleaning database..."
Booking.destroy_all
Cave.destroy_all
User.destroy_all
puts "Seeding database..."

User.create(email: "captain@caveman.com", password: "123456")
User.create(email: "conan@thebarbarian.com", password: "123456")
User.create(email: "gollum@thepreciouss.net", password: "123456")
User.create(email: "barney@rubble.com", password: "123456")
User.create(email: "fred@flintstone.com", password: "123456")

Cave.create(name: "Gollum's Preciouss Pad", user: User.third, description: "It's so precious!", price: "4", remote_photo_url: 'https://wonderopolis.org/_img?img=/wp-content/uploads/2013/10/dreamstime_xl_4842587-custom.jpg&transform=resizeCrop,720,450')
Cave.create(name: "Captain's Unga Bungalow", user: User.first, description: "Unga bunga!", price: "6", remote_photo_url: 'https://img-aws.ehowcdn.com/877x500p/photos.demandstudios.com/getty/article/144/177/177044797.jpg')
Cave.create(name: "Cimmerian Spice", user: User.second, description: "What is best in life? To crush your enemies, to see them driven before you, and to hear the lamentations of whoever you beat to this cave.", price: "5", remote_photo_url: 'https://www.asiatouradvisor.com/wp-content/uploads/2017/11/8-most-attractive-caves-visitors-can-explore-in-Quang-Binh4.jpg')

Booking.create(cave: Cave.first, user: User.first, checkin: "10-10-2018", checkout: "10-12-2018")
Booking.create(cave: Cave.last, user: User.first, checkin: "10-10-2018", checkout: "10-12-2018")
Booking.create(cave: Cave.second, user: User.second, checkin: "10-11-2018", checkout: "11-12-2018")
# 
