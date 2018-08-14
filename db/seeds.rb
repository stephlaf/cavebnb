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
Amenity.destroy_all
User.destroy_all
puts "Seeding database..."

User.create(email: "captain@caveman.com", password: "123456")
User.create(email: "conan@thebarbarian.com", password: "123456")
User.create(email: "gollum@thepreciouss.net", password: "123456")
User.create(email: "barney@rubble.com", password: "123456")
User.create(email: "fred@flintstone.com", password: "123456")

Amenity.create(name:"Boulder", description:"Roll some sweet hard rock goodness in front of your cave to seal the entrance against the elements (and dinosaurs)", icon:'<i class="fas fa-meh-rolling-eyes"></i>')
Amenity.create(name:"Covered Pit", description:"Experience the sweet relief of aromatic freedom, as you close the lid on your, um, excretions.", icon:'<i class="fa fa-poo"></i>')
Amenity.create(name:"Club", description:"Leave your worries -- and your tools! -- at home. This cave comes furnished with a club.", icon:'<i class="fa fa-utensil-spoon"></i>')
Amenity.create(name:"Solar Lighting", description:"Electricity hasn't even been invented yet, so why waste it? This cave is lit by the power of the sun. Just not at night.", icon:'<i class="fa fa-sun"></i>')
Amenity.create(name:"Spirit Guides", description:"Take a tour of the hunting grounds around this cave, with a local spirit guide.", icon:'<i class="fab fa-studiovinari"></i>')
Amenity.create(name:"Drums", description:"Rock out and talk to your fellow nomads with some sweet sounding drums.", icon:'<i class="fas fa-drum"></i>')
Amenity.create(name:"Evil Demon", description:"For a more adventurous journey, this cave comes fully infested with horrible monsters for you to slay.", icon:'<i class="fab fa-drupal"></i>')
Amenity.create(name:"Flowing Water", description:"This cave is close to a water source for bathing and fishing.", icon:'<i class="fas fa-swimmer"></i>')
Amenity.create(name:"Forbidden Fruit", description:"Get some tasty knowledge and vitamin C with this cave's stash of forbidden fruit.", icon:'<i class="fab fa-apple"></i>')
Amenity.create(name:"Air Freshener", description:"This cave has an air freshener.", icon:'fas fa-air-freshener')

Cave.create(name: "Gollum's Preciouss Pad", user: User.third, description: "It's so precious!", price: "4", remote_photo_url: 'https://wonderopolis.org/_img?img=/wp-content/uploads/2013/10/dreamstime_xl_4842587-custom.jpg&transform=resizeCrop,720,450')
Cave.create(name: "Captain's Unga Bungalow", user: User.first, description: "Unga bunga!", price: "6", remote_photo_url: 'https://img-aws.ehowcdn.com/877x500p/photos.demandstudios.com/getty/article/144/177/177044797.jpg')
Cave.create(name: "Cimmerian Spice", user: User.second, description: "What is best in life? To crush your enemies, to see them driven before you, and to hear the lamentations of whoever you beat to this cave.", price: "5", remote_photo_url: 'https://www.asiatouradvisor.com/wp-content/uploads/2017/11/8-most-attractive-caves-visitors-can-explore-in-Quang-Binh4.jpg')

Booking.create(cave: Cave.first, user: User.first, checkin: "10-10-2018", checkout: "10-12-2018")
Booking.create(cave: Cave.last, user: User.first, checkin: "10-10-2018", checkout: "10-12-2018")
Booking.create(cave: Cave.second, user: User.second, checkin: "10-11-2018", checkout: "11-12-2018")
#
