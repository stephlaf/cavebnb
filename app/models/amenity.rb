class Amenity < ApplicationRecord
  has_many :cave_amenities
  has_many :caves, through: :cave_amenities

   include PgSearch
  multisearchable :against => [:name, :icon, :description]

end
